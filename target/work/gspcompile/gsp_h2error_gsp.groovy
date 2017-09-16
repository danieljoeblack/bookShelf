import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

@GrailsPlugin(name='h2', version='0.2.6')
class gsp_h2error_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/plugins/h2-0.2.6/grails-app/views/error.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
createTagBody(2, {->
createClosureForHtmlPart(2, 3)
invokeTag('captureTitle','sitemesh',3,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',3,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',24,[:],1)
printHtmlPart(4)
createTagBody(1, {->
printHtmlPart(5)
expressionOut.print(request.'javax.servlet.error.status_code')
printHtmlPart(6)
expressionOut.print(request.'javax.servlet.error.message'.encodeAsHTML())
printHtmlPart(7)
expressionOut.print(request.'javax.servlet.error.servlet_name')
printHtmlPart(8)
expressionOut.print(request.'javax.servlet.error.request_uri')
printHtmlPart(9)
if(true && (exception)) {
printHtmlPart(10)
expressionOut.print(exception.message?.encodeAsHTML())
printHtmlPart(11)
expressionOut.print(exception.cause?.message?.encodeAsHTML())
printHtmlPart(12)
expressionOut.print(exception.className)
printHtmlPart(13)
expressionOut.print(exception.lineNumber)
printHtmlPart(14)
for( cs in (exception.codeSnippet) ) {
printHtmlPart(15)
expressionOut.print(cs?.encodeAsHTML())
printHtmlPart(16)
}
printHtmlPart(17)
}
printHtmlPart(18)
if(true && (exception)) {
printHtmlPart(19)
for( _it25796343 in (exception.stackTraceLines) ) {
changeItVariable(_it25796343)
expressionOut.print(it.encodeAsHTML())
printHtmlPart(20)
}
printHtmlPart(21)
}
printHtmlPart(22)
})
invokeTag('captureBody','sitemesh',53,[:],1)
printHtmlPart(23)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1235154256000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
