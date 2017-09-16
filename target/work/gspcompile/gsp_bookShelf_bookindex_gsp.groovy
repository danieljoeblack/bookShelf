import bookshelf.Book
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bookShelf_bookindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/book/index.gsp" }
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
invokeTag('message','g',9,['code':("default.index.label"),'args':([entityName])],-1)
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
invokeTag('sortableColumn','g',20,['property':("author"),'title':(message(code: 'book.author.label', default: 'Author'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',22,['property':("dateCreated"),'title':(message(code: 'book.dateCreated.label', default: 'Date Created'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',24,['property':("description"),'title':(message(code: 'book.description.label', default: 'Description'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',26,['property':("publisher"),'title':(message(code: 'book.publisher.label', default: 'Publisher'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',28,['property':("title"),'title':(message(code: 'book.title.label', default: 'Title'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',30,['property':("yearOfPub"),'title':(message(code: 'book.yearOfPub.label', default: 'Year Of Pub'))],-1)
printHtmlPart(6)
loop:{
int i = 0
for( bookInstance in (bookInstanceList) ) {
printHtmlPart(7)
expressionOut.print((i % 2) == 0 ? 'odd' : 'even')
printHtmlPart(8)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: bookInstance, field: "author"))
})
invokeTag('link','g',38,['action':("show"),'id':(bookInstance.id)],3)
printHtmlPart(9)
invokeTag('formatDate','g',40,['date':(bookInstance.dateCreated)],-1)
printHtmlPart(9)
expressionOut.print(fieldValue(bean: bookInstance, field: "description"))
printHtmlPart(9)
expressionOut.print(fieldValue(bean: bookInstance, field: "publisher"))
printHtmlPart(9)
expressionOut.print(fieldValue(bean: bookInstance, field: "title"))
printHtmlPart(9)
expressionOut.print(fieldValue(bean: bookInstance, field: "yearOfPub"))
printHtmlPart(10)
i++
}
}
printHtmlPart(11)
invokeTag('paginate','bs',55,['total':(bookInstanceCount)],-1)
printHtmlPart(12)
})
invokeTag('captureBody','sitemesh',59,[:],1)
printHtmlPart(13)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1504022891490L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
