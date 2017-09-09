package bookshelf

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

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
}
