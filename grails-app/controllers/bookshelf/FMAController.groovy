package bookshelf

/**
 * FMAController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class FMAController {

	static scaffold = false
//	def index = { }

    def search(){
        render(view:"Search")
    }
}
