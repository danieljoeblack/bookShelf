package bookshelf

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Book)
class BookSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test getShorterDescription"() {
        Book book = new Book();
        book.setDescription("This.Description.will.be.cut.shorter")
        
        expect:
        book.getShorterDescription() == "This.Description.will."
    }
}
