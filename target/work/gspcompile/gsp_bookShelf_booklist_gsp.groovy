import bookshelf.Book
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bookShelf_booklist_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/book/list.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("kickstart")],-1)
printHtmlPart(3)
invokeTag('set','g',9,['var':("entityName"),'value':(message(code: 'book.label', default: 'Book'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',10,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',10,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',10,[:],2)
printHtmlPart(0)
})
invokeTag('captureHead','sitemesh',11,[:],1)
printHtmlPart(4)
createTagBody(1, {->
printHtmlPart(5)
createTagBody(2, {->
printHtmlPart(6)
invokeTag('actionSubmit','g',28,['style':("margin-top: 5%; margin-bottom: 5%;"),'class':("btn btn-default"),'action':("list"),'value':("Search")],-1)
printHtmlPart(7)
})
invokeTag('form','g',29,['id':("searchForm"),'action':("list")],2)
printHtmlPart(8)
createTagBody(2, {->
printHtmlPart(9)
expressionOut.print(max)
printHtmlPart(10)
})
invokeTag('uploadForm','g',35,['action':("list")],2)
printHtmlPart(11)
invokeTag('sortableColumn','g',41,['property':("title"),'title':(message(code: 'book.title.label', default: 'Title'))],-1)
printHtmlPart(12)
invokeTag('sortableColumn','g',42,['property':("author"),'title':(message(code: 'book.author.label', default: 'Author'))],-1)
printHtmlPart(13)
invokeTag('sortableColumn','g',43,['property':("publisher"),'title':(message(code: 'book.publisher.label', default: 'Publisher'))],-1)
printHtmlPart(12)
invokeTag('sortableColumn','g',44,['property':("yearOfPub"),'title':(message(code: 'book.yearOfPub.label', default: 'Year Of Pub'))],-1)
printHtmlPart(13)
invokeTag('sortableColumn','g',45,['property':("description"),'title':(message(code: 'book.description.label', default: 'Description'))],-1)
printHtmlPart(14)
createTagBody(2, {->
printHtmlPart(15)
loop:{
int i = 0
for( bookInstance in (bookInstanceList) ) {
printHtmlPart(16)
expressionOut.print((i % 2) == 0 ? 'odd' : 'even')
printHtmlPart(17)
createTagBody(4, {->
printHtmlPart(18)
expressionOut.print(fieldValue(bean: bookInstance, field: "imageLink"))
printHtmlPart(19)
})
invokeTag('link','g',54,['action':("show"),'id':(bookInstance.id)],4)
printHtmlPart(20)
createTagBody(4, {->
expressionOut.print(fieldValue(bean: bookInstance, field: "title"))
})
invokeTag('link','g',55,['action':("show"),'id':(bookInstance.id)],4)
printHtmlPart(21)
expressionOut.print(fieldValue(bean: bookInstance, field: "author"))
printHtmlPart(20)
expressionOut.print(fieldValue(bean: bookInstance, field: "publisher"))
printHtmlPart(20)
expressionOut.print(fieldValue(bean: bookInstance, field: "yearOfPub"))
printHtmlPart(20)
expressionOut.print(bookInstance.getShorterDescription())
printHtmlPart(22)
expressionOut.print(fieldValue(bean: bookInstance, field: "description"))
printHtmlPart(23)
expressionOut.print(fieldValue(bean: bookInstance, field: "id"))
printHtmlPart(24)
expressionOut.print(i)
printHtmlPart(25)
expressionOut.print(bookInstance.id)
printHtmlPart(26)
expressionOut.print(fieldValue(bean: bookInstance, field: "id"))
printHtmlPart(27)
if(true && (fieldValue(bean: bookInstance, field: "genre"))) {
printHtmlPart(28)
expressionOut.print(fieldValue(bean: bookInstance, field: "genre"))
printHtmlPart(29)
}
printHtmlPart(30)
if(true && (fieldValue(bean: bookInstance, field: "isbn"))) {
printHtmlPart(31)
expressionOut.print(fieldValue(bean: bookInstance, field: "isbn"))
printHtmlPart(29)
}
printHtmlPart(30)
if(true && (fieldValue(bean: bookInstance, field: "pageCount"))) {
printHtmlPart(32)
expressionOut.print(fieldValue(bean: bookInstance, field: "pageCount"))
printHtmlPart(29)
}
printHtmlPart(30)
if(true && (fieldValue(bean: bookInstance, field: "rating"))) {
printHtmlPart(33)
expressionOut.print(fieldValue(bean: bookInstance, field: "rating"))
printHtmlPart(29)
}
printHtmlPart(30)
if(true && (fieldValue(bean: bookInstance, field: "numOfRates"))) {
printHtmlPart(34)
expressionOut.print(fieldValue(bean: bookInstance, field: "numOfRates"))
printHtmlPart(29)
}
printHtmlPart(30)
if(true && (fieldValue(bean: bookInstance, field: "publicDomain"))) {
printHtmlPart(35)
expressionOut.print(fieldValue(bean: bookInstance, field: "publicDomain"))
printHtmlPart(29)
}
printHtmlPart(36)
i++
}
}
printHtmlPart(37)
invokeTag('actionSubmit','g',105,['hidden id':("deleteButton"),'action':("deleteCheckedBooks"),'value':("Delete Checked Books")],-1)
printHtmlPart(38)
})
invokeTag('form','g',106,[:],2)
printHtmlPart(39)
invokeTag('paginate','bs',112,['total':(bookInstanceCount)],-1)
printHtmlPart(40)
})
invokeTag('captureBody','sitemesh',163,[:],1)
printHtmlPart(41)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1505063066419L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
