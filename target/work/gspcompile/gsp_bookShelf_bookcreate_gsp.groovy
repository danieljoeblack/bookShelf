import bookshelf.Book
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bookShelf_bookcreate_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/book/create.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('set','g',9,['var':("entityName"),'value':(message(code: 'book.label', default: 'Book'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',10,['code':("default.create.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',10,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',10,[:],2)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',11,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("kickstart")],-1)
printHtmlPart(4)
})
invokeTag('captureHead','sitemesh',12,[:],1)
printHtmlPart(5)
createTagBody(1, {->
printHtmlPart(6)
createTagBody(2, {->
printHtmlPart(7)
invokeTag('renderErrors','g',20,['bean':(bookInstance),'as':("list")],-1)
printHtmlPart(8)
})
invokeTag('hasErrors','g',22,['bean':(bookInstance)],2)
printHtmlPart(9)
createTagBody(2, {->
printHtmlPart(10)
invokeTag('render','g',25,['template':("form")],-1)
printHtmlPart(11)
invokeTag('submitButton','g',28,['name':("create"),'class':("btn btn-primary"),'value':(message(code: 'default.button.create.label', default: 'Create'))],-1)
printHtmlPart(12)
invokeTag('message','g',29,['code':("default.button.reset.label"),'default':("Reset")],-1)
printHtmlPart(13)
})
invokeTag('form','g',31,['action':("save"),'class':("form-horizontal"),'role':("form")],2)
printHtmlPart(14)
})
invokeTag('captureBody','sitemesh',40,[:],1)
printHtmlPart(15)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1505073654309L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
