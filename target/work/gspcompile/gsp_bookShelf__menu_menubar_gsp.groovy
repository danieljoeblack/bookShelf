import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bookShelf__menu_menubar_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/_menu/_menubar.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
loop:{
int i = 0
for( c in (grailsApplication.controllerClasses.sort { it.logicalPropertyName }) ) {
printHtmlPart(1)
if(true && (!c.logicalPropertyName.contains("home")&&!c.logicalPropertyName.contains("_")&&!c.logicalPropertyName.contains("error")&&!c.logicalPropertyName.contains("db"))) {
printHtmlPart(2)
expressionOut.print(params.controller == c.logicalPropertyName ? " active" : "")
printHtmlPart(3)
createTagBody(3, {->
printHtmlPart(4)
invokeTag('message','g',8,['code':("${c.logicalPropertyName}.label"),'default':(c.logicalPropertyName.capitalize())],-1)
printHtmlPart(5)
})
invokeTag('link','g',9,['controller':(c.logicalPropertyName),'action':("index")],3)
printHtmlPart(6)
}
printHtmlPart(7)
i++
}
}
printHtmlPart(8)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1504024575470L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
