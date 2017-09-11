package bookshelf

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification
import bookShelf.*
/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
class BookUtilitySpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test convertTabDelimitedToBook good row"() {
        String tabDelimitedBook = "book1	author1	publisher1	yearOfPub1	description1"
        
        Book newBook = BookUtility.convertTabDelimitedToBook(tabDelimitedBook)
        
        expect:
        newBook.title == "book1"
        newBook.author == "author1"
        newBook.publisher == "publisher1"
        newBook.yearOfPub == "yearOfPub1"
        newBook.description == "description1"
    }
    
    void "test ordinalIndexOf first index"(){
        String hString = "this string has at least 3 h's"
        int indexToFind = 1
        expect:
        BookUtility.ordinalIndexOf(hString,"h",indexToFind) == 2
    }
    
    void "test ordinalIndexOf second index"(){
        String hString = "this string has at least 3 h's"
        int indexToFind = 2
        expect:
        BookUtility.ordinalIndexOf(hString,"h",indexToFind) == 13
    }
    
    void "test ordinalIndexOf third index"(){
        String hString = "this string has at least 3 h's"
        int indexToFind = 3
        expect:
        BookUtility.ordinalIndexOf(hString,"h",indexToFind) == 28
    }
}
