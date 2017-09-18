import bookshelf.Book
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bookShelf_book_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/book/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
if(true && (params.action != "edit")) {
printHtmlPart(1)
}
printHtmlPart(2)
expressionOut.print(hasErrors(bean: bookInstance, field: 'title', 'error'))
printHtmlPart(3)
invokeTag('message','g',37,['code':("book.title.label"),'default':("Title")],-1)
printHtmlPart(4)
invokeTag('textField','g',39,['id':("title"),'ng-model':("title"),'class':("form-control"),'name':("title"),'value':(bookInstance?.title)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'title', 'error'))
printHtmlPart(6)
expressionOut.print(hasErrors(bean: bookInstance, field: 'author', 'error'))
printHtmlPart(7)
invokeTag('message','g',45,['code':("book.author.label"),'default':("Author")],-1)
printHtmlPart(4)
invokeTag('textField','g',47,['id':("author"),'ng-model':("author"),'class':("form-control"),'name':("author"),'value':(bookInstance?.author)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'author', 'error'))
printHtmlPart(8)
expressionOut.print(hasErrors(bean: bookInstance, field: 'publisher', 'error'))
printHtmlPart(9)
invokeTag('message','g',53,['code':("book.publisher.label"),'default':("Publisher")],-1)
printHtmlPart(4)
invokeTag('textField','g',55,['id':("publisher"),'ng-model':("publisher"),'class':("form-control"),'name':("publisher"),'value':(bookInstance?.publisher)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'publisher', 'error'))
printHtmlPart(8)
expressionOut.print(hasErrors(bean: bookInstance, field: 'yearOfPub', 'error'))
printHtmlPart(10)
invokeTag('message','g',61,['code':("book.yearOfPub.label"),'default':("Year Of Pub")],-1)
printHtmlPart(4)
invokeTag('textField','g',63,['id':("yearOfPub"),'ng-model':("yearOfPub"),'class':("form-control"),'name':("yearOfPub"),'value':(bookInstance?.yearOfPub)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'yearOfPub', 'error'))
printHtmlPart(11)
expressionOut.print(hasErrors(bean: bookInstance, field: 'description', 'error'))
printHtmlPart(12)
invokeTag('message','g',69,['code':("book.description.label"),'default':("Description")],-1)
printHtmlPart(4)
invokeTag('textArea','g',71,['is':("description"),'ng-model':("description"),'class':("form-control"),'rows':("5"),'cols':("40"),'name':("description"),'value':(bookInstance?.description)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'description', 'error'))
printHtmlPart(8)
expressionOut.print(hasErrors(bean: bookInstance, field: 'genre', 'error'))
printHtmlPart(13)
invokeTag('message','g',77,['code':("book.genre.label"),'default':("Genre")],-1)
printHtmlPart(4)
invokeTag('textField','g',79,['id':("genre"),'ng-model':("genre"),'class':("form-control"),'rows':("5"),'cols':("40"),'name':("genre"),'value':(bookInstance?.genre)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'genre', 'error'))
printHtmlPart(8)
expressionOut.print(hasErrors(bean: bookInstance, field: 'isbn', 'error'))
printHtmlPart(14)
invokeTag('message','g',85,['code':("book.isbn.label"),'default':("ISBN")],-1)
printHtmlPart(4)
invokeTag('textField','g',87,['id':("isbn"),'ng-model':("isbn"),'class':("form-control"),'rows':("5"),'cols':("40"),'name':("isbn"),'value':(bookInstance?.isbn)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'isbn', 'error'))
printHtmlPart(8)
expressionOut.print(hasErrors(bean: bookInstance, field: 'pageCount', 'error'))
printHtmlPart(15)
invokeTag('message','g',93,['code':("book.pageCount.label"),'default':("Page Count")],-1)
printHtmlPart(4)
invokeTag('textField','g',95,['id':("pageCount"),'ng-model':("pageCount"),'class':("form-control"),'rows':("5"),'cols':("40"),'name':("pageCount"),'value':(bookInstance?.pageCount)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'pageCount', 'error'))
printHtmlPart(8)
expressionOut.print(hasErrors(bean: bookInstance, field: 'rating', 'error'))
printHtmlPart(16)
invokeTag('message','g',101,['code':("book.rating.label"),'default':("Rating")],-1)
printHtmlPart(4)
invokeTag('textField','g',103,['id':("rating"),'ng-model':("rating"),'class':("form-control"),'rows':("5"),'cols':("40"),'name':("rating"),'value':(bookInstance?.rating)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'rating', 'error'))
printHtmlPart(8)
expressionOut.print(hasErrors(bean: bookInstance, field: 'numOfRates', 'error'))
printHtmlPart(17)
invokeTag('message','g',109,['code':("book.numOfRates.label"),'default':("Number of Voters")],-1)
printHtmlPart(4)
invokeTag('textField','g',111,['id':("numOfRates"),'ng-model':("numOfRates"),'class':("form-control"),'rows':("5"),'cols':("40"),'name':("numOfRates"),'value':(bookInstance?.numOfRates)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'numOfRates', 'error'))
printHtmlPart(8)
expressionOut.print(hasErrors(bean: bookInstance, field: 'publicDomain', 'error'))
printHtmlPart(18)
invokeTag('message','g',117,['code':("book.publicDomain.label"),'default':("Public Domain")],-1)
printHtmlPart(4)
invokeTag('textField','g',119,['id':("publicDomain"),'ng-model':("publicDomain"),'class':("form-control"),'rows':("5"),'cols':("40"),'name':("publicDomain"),'value':(bookInstance?.publicDomain)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'publicDomain', 'error'))
printHtmlPart(19)
expressionOut.print(hasErrors(bean: bookInstance, field: 'imageLink', 'error'))
printHtmlPart(20)
invokeTag('message','g',125,['code':("book.description.label"),'default':("Image Link")],-1)
printHtmlPart(4)
invokeTag('textField','g',127,['ng-model':("imageLink"),'class':("form-control"),'name':("imageLink"),'value':(bookInstance?.imageLink)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: bookInstance, field: 'imageLink', 'error'))
printHtmlPart(21)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1505090613796L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}