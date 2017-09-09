package bookshelf


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * BookController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class BookController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    //needed for cleanUpGorm()
    def sessionFactory
    static def propertyInstanceMap = org.codehaus.groovy.grails.plugins.DomainClassGrailsPlugin.PROPERTY_INSTANCE_MAP
    
    //for storing the upload books such that they can be accesed from multiple methods
    ArrayList<Book> booksFromFile
    
    //custom actions
    
    def booksFound(){
        render (view:"booksFound")
    }
    
    def uploadBooks(){
        render (view:"uploadBooks") 
    }
    
    def deletedBooks(deletedBooks){
        render (view:"deletedBooks", model:[deletedBooks:deletedBooks])
    }
    
    def upload(){
        def bookFile = request.getFile("bookFile")
        ArrayList<String> tabDelimitedBooks = new ArrayList<String>()
        ArrayList<Book> books = new ArrayList<Book>()
        Book newBook
        
        if(bookFile.getContentType() != "text/plain"){
            throw new IllegalArgumentException("This is not a valid file format")
        }
        
        bookFile.inputStream.splitEachLine('\n\r') { fields ->
                tabDelimitedBooks.add(fields[0])
        }
        for(String book:tabDelimitedBooks){
            newBook = BookUtility.convertTabDelimitedToBook(book)
            books.add(newBook)
        }
        books.trimToSize()
        booksFromFile = books
        render (view:"booksFound", model:[booksFound:books,booksFoundCount:books.size()])
    }
    
    def saveBooks(){
        int counter = 0
        for(Book book:booksFromFile){
            book.save(failOnError:true)
            counter++
            if(counter % 100 == 0){
                cleanUpGorm()
            }
        }
        render(view:"saveConfirmation",model:[count:counter])
    }
    
    /********************************************************************************************
    *ACTION-This action will find all checked boxes on the page and delete the products selected*
    *********************************************************************************************/
    def deleteCheckedBooks(){
        //vars
        int numberOfItemsPossiblyChecked
        ArrayList<Integer> checkedIds = new ArrayList<Integer>()
        ArrayList<Book> deletedBooks = new ArrayList<Book>()
        Book bookToDelete
        
        //set the max number of items they could have selected by checking the pagination max value
        if(params.maxChecks == null){
            numberOfItemsPossiblyChecked = 10
        }else{
            numberOfItemsPossiblyChecked = params.maxChecks.toInteger()
        }
        //for each number in the range of 0-numberOfItemsPossiblyChecked
        for(int i=0;i<=numberOfItemsPossiblyChecked;i++){
            //check if each box on the page was selected and if it was add it to an array of ids
            if(params.("deleteFlag"+i.toString())){
                checkedIds.add(params.("deleteFlag"+i.toString()).toInteger())
            }
        }
        println checkedIds
        //loop through the array of ids deleting each one and adding it to array for view
        for(int id:checkedIds){
            bookToDelete = Book.findById(id)
            deletedBooks.add(bookToDelete)
            bookToDelete.delete(failOnError:true,flush:true)
        }
        println deletedBooks
        //pass the array of deleted items to deleteCheckedProducts view
        render view:"deletedBooks",model:[deletedBooks:deletedBooks]
    }
    
    public void cleanUpGorm() {
        def session = sessionFactory.currentSession
        session.flush()
        session.clear()
        propertyInstanceMap.get().clear()
    }
    
    //pre-built methods and actions
	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render view:"list" , model:[max:params.max,bookInstanceList:Book.list(params),bookInstanceCount: Book.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if(max > Book.list(params).size()){
            params.max = Book.list(params).size()
        }
        render view:"list" , model:[max:params.max,bookInstanceList:Book.list(params),bookInstanceCount: Book.count()]
    }
    def googleInfo(){
        render(view:"googleInfo")
    }
    
    
    
    def show(Book bookInstance) {
        render view:"show", model:[bookInstance:bookInstance]
    }

    def create() {
        render view:"create", model:[bookInstance:new Book(params)]
        //respond new Book(params)
    }

    @Transactional
    def save(Book bookInstance) {
        if (bookInstance == null) {
            notFound()
            return
        }

        if (bookInstance.hasErrors()) {
            respond bookInstance.errors, view:'create'
            return
        }

        bookInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bookInstance.label', default: 'Book'), bookInstance.id])
                redirect bookInstance
            }
            '*' { respond bookInstance, [status: CREATED] }
        }
    }

    def edit(Book bookInstance) {
        render view:"edit",model:[bookInstance:bookInstance]
    }

    @Transactional
    def update(Book bookInstance) {
        if (bookInstance == null) {
            notFound()
            return
        }

        if (bookInstance.hasErrors()) {
            respond bookInstance.errors, view:'edit'
            return
        }

        bookInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Book.label', default: 'Book'), bookInstance.id])
                redirect bookInstance
            }
            '*'{ respond bookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Book bookInstance) {

        if (bookInstance == null) {
            notFound()
            return
        }

        bookInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Book.label', default: 'Book'), bookInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookInstance.label', default: 'Book'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
