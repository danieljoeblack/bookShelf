import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bookShelf_bookbooksFound_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/book/booksFound.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',11,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("Content-Type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',12,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("kickstart")],-1)
printHtmlPart(2)
createTagBody(2, {->
createClosureForHtmlPart(3, 3)
invokeTag('captureTitle','sitemesh',13,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',13,[:],2)
printHtmlPart(4)
})
invokeTag('captureHead','sitemesh',14,[:],1)
printHtmlPart(4)
createTagBody(1, {->
printHtmlPart(5)
expressionOut.print(booksFoundCount)
printHtmlPart(6)
invokeTag('sortableColumn','g',22,['property':("title"),'title':(message(code: 'book.title.label', default: 'Title'))],-1)
printHtmlPart(7)
invokeTag('sortableColumn','g',23,['property':("author"),'title':(message(code: 'book.author.label', default: 'Author'))],-1)
printHtmlPart(7)
invokeTag('sortableColumn','g',24,['property':("publisher"),'title':(message(code: 'book.publisher.label', default: 'Publisher'))],-1)
printHtmlPart(7)
invokeTag('sortableColumn','g',25,['property':("yearOfPub"),'title':(message(code: 'book.yearOfPub.label', default: 'Year Of Pub'))],-1)
printHtmlPart(7)
invokeTag('sortableColumn','g',26,['property':("description"),'title':(message(code: 'book.description.label', default: 'Description'))],-1)
printHtmlPart(8)
loop:{
int i = 0
for( bookInstance in (booksFound) ) {
printHtmlPart(9)
expressionOut.print((i % 2) == 0 ? 'odd' : 'even')
printHtmlPart(10)
expressionOut.print(fieldValue(bean: bookInstance, field: "title"))
printHtmlPart(11)
expressionOut.print(fieldValue(bean: bookInstance, field: "author"))
printHtmlPart(11)
expressionOut.print(fieldValue(bean: bookInstance, field: "publisher"))
printHtmlPart(11)
expressionOut.print(fieldValue(bean: bookInstance, field: "yearOfPub"))
printHtmlPart(11)
expressionOut.print(fieldValue(bean: bookInstance, field: "description"))
printHtmlPart(12)
i++
}
}
printHtmlPart(13)
createTagBody(2, {->
printHtmlPart(14)
invokeTag('actionSubmit','g',46,['class':("btn btn-default"),'value':("Save These Books"),'action':("saveBooks")],-1)
printHtmlPart(15)
})
invokeTag('uploadForm','g',47,[:],2)
printHtmlPart(16)
})
invokeTag('captureBody','sitemesh',49,[:],1)
printHtmlPart(17)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1504932025729L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
