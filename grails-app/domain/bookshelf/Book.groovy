package bookshelf
import grails.rest.*
@Resource(uri='/fitmentProducts')
/**
 * Book
 * A domain class to hold title, author, publisher, short description, year of publication
 */
class Book {
        //db stuff
	Long	id
	Date	dateCreated
	
        //user stuff
        String title
        String author
        String publisher
        String description
        String yearOfPub
        /*
        String genre
        String isbn
        */
    static	mapping = {
        autoTimestamp true
        table name: "books"
        title          column: "title"
        author         column: "author"
        publisher      column: "publisher"
        description    column: "description"
        yearOfPub      column: "year_of_pub"
    }
    
	static	constraints = {
    }
	//empty constructor to allow for blank classes
        public book(){
            this.title = null
            this.author = null 
            this.publisher = null
            this.yearOfPub = null
            this.description = null
        }
        
        //full constructor
        public Book(String  title,String author,String publisher,String yearOfPub,String description){
            this.title = title
            this.author = author 
            this.publisher = publisher
            this.yearOfPub = yearOfPub
            this.description = description
        }
        
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
