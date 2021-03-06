import bookshelf.Book
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bookShelf_bookedit_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/book/edit.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("kickstart")],-1)
printHtmlPart(2)
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'book.label', default: 'Book'))],-1)
printHtmlPart(1)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',9,['code':("default.edit.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(4)
createTagBody(1, {->
printHtmlPart(5)
createTagBody(2, {->
printHtmlPart(6)
invokeTag('renderErrors','g',18,['bean':(bookInstance),'as':("list")],-1)
printHtmlPart(7)
})
invokeTag('hasErrors','g',20,['bean':(bookInstance)],2)
printHtmlPart(8)
createTagBody(2, {->
printHtmlPart(9)
invokeTag('hiddenField','g',23,['name':("id"),'value':(bookInstance?.id)],-1)
printHtmlPart(9)
invokeTag('hiddenField','g',24,['name':("version"),'value':(bookInstance?.version)],-1)
printHtmlPart(9)
invokeTag('hiddenField','g',25,['name':("_method"),'value':("PUT")],-1)
printHtmlPart(10)
invokeTag('render','g',27,['template':("form")],-1)
printHtmlPart(11)
invokeTag('actionSubmit','g',30,['class':("btn btn-primary"),'action':("update"),'value':(message(code: 'default.button.update.label', default: 'Update'))],-1)
printHtmlPart(12)
invokeTag('message','g',31,['code':("default.button.reset.label"),'default':("Reset")],-1)
printHtmlPart(13)
})
invokeTag('form','g',33,['method':("post"),'class':("form-horizontal"),'role':("form")],2)
printHtmlPart(14)
})
invokeTag('captureBody','sitemesh',37,[:],1)
printHtmlPart(15)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1505000575135L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
