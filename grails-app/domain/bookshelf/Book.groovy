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
        String imageLink
        String genre
        String isbn
        String pageCount
        String rating
        String numOfRates
        String smallImageLink
        String publicDomain
        String downloadLinkEpub
        String downloadLinkPdf
    
    static	mapping = {
        autoTimestamp true
        version false
        table name: "books"
        title          column: "title" 
        author         column: "author"
        publisher      column: "publisher" 
        description    column: "description", type: 'text'
        yearOfPub      column: "year_of_pub"
        imageLink      column: "image_link"
        genre          column: "genre"
        isbn           column: "isbn"
        pageCount      column: "page_count"
        rating         column: "rating"
        numOfRates     column: "num_of_rates"
        smallImageLink column: "small_image_link"
        publicDomain   column: "public_domain"
    }
    
	static	constraints = {
            description maxSize:5000
            publisher   nullable:true
            yearOfPub   nullable:true
            imageLink   nullable:true
            genre       nullable:true
            pageCount   nullable:true
            rating      nullable:true
            numOfRates  nullable:true
            smallImageLink nullable:true
            publicDomain nullable:true
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
        
    //new full constructor
        public Book(String title,String author,String publisher,String description,String yearOfPub,String imageLink,String genre,String isbn,String pageCount,String rating,String numOfRates,String smallImageLink,String publicDomain,String downloadLinkEpub, String downloadLinkPdf){
            this.title = title
            this.author = author 
            this.publisher = publisher
            this.yearOfPub = yearOfPub
            this.description = description
            this.imageLink = imageLink
            this.genre = genre
            this.isbn = isbn
            this.pageCount = pageCount
            this.rating = rating
            this.numOfRates = numOfRates
            this.smallImageLink = smallImageLink
            this.publicDomain = publicDomain
            this.downloadLinkEpub = downloadLinkEpub
            this.downloadLinkPdf = downloadLinkPdf
        }
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
        /****************************************************************************************************************************************************************************************************
        *METHOD -This method will return the description shortened to the first three sentences. If the description has yet to be set when this method is called an illegalArgumentExpection willl be thrown*
        *****************************************************************************************************************************************************************************************************/
        public String getShorterDescription(){
             if(this.description){
                 String shorterDescription
                 int indexOfThirdPeriod = BookUtility.ordinalIndexOf(this.description,".",3)
                 
                 shorterDescription = this.description.substring(0,indexOfThirdPeriod)
                 if(indexOfThirdPeriod > 4)
                    return shorterDescription
                 else
                    return this.description
             }else{
                 return ""
             }
         }
}
