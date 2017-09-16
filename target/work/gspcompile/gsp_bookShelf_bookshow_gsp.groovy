import bookshelf.Book
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bookShelf_bookshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/book/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("kickstart")],-1)
printHtmlPart(2)
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'book.label', default: 'Book'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',9,['code':("default.show.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(0)
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
invokeTag('message','g',19,['code':("book.image.label"),'default':("Image")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: bookInstance, field: "imageLink"))
printHtmlPart(6)
invokeTag('message','g',26,['code':("book.title.label"),'default':("Title")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "title"))
printHtmlPart(8)
invokeTag('message','g',33,['code':("book.author.label"),'default':("Author")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "author"))
printHtmlPart(8)
invokeTag('message','g',40,['code':("book.publisher.label"),'default':("Publisher")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "publisher"))
printHtmlPart(8)
invokeTag('message','g',47,['code':("book.yearOfPub.label"),'default':("Year Of Pub")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "yearOfPub"))
printHtmlPart(8)
invokeTag('message','g',54,['code':("book.description.label"),'default':("Description")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "description"))
printHtmlPart(9)
invokeTag('message','g',61,['code':("book.dateCreated.label"),'default':("Date Created")],-1)
printHtmlPart(7)
invokeTag('formatDate','g',63,['date':(bookInstance?.dateCreated)],-1)
printHtmlPart(10)
invokeTag('message','g',68,['code':("book.genre.label"),'default':("Genre")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "genre"))
printHtmlPart(11)
invokeTag('message','g',75,['code':("book.isbn.label"),'default':("ISBN")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "isbn"))
printHtmlPart(11)
invokeTag('message','g',82,['code':("book.pageCount.label"),'default':("pageCount")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "pageCount"))
printHtmlPart(11)
invokeTag('message','g',89,['code':("book.rating.label"),'default':("Rating")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "rating"))
printHtmlPart(11)
invokeTag('message','g',96,['code':("book.numOfRates.label"),'default':("Number of Votes")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "numOfRates"))
printHtmlPart(11)
invokeTag('message','g',103,['code':("book.publicDomain.label"),'default':("Is in Public Domain")],-1)
printHtmlPart(7)
expressionOut.print(fieldValue(bean: bookInstance, field: "publicDomain"))
printHtmlPart(12)
})
invokeTag('captureBody','sitemesh',113,[:],1)
printHtmlPart(13)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1505010874056L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
