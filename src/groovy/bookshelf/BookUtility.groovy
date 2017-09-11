/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bookshelf
/**
 *
 * @author danie
 */
class BookUtility {
    public static convertTabDelimitedToBook(String tabDelimitedBook){
        String title
        String author
        String publisher
        String description
        String yearOfPub
        
        //The row should have the format 'Title\tAuthor\tpublisher\tyearOfPub\tdescription' (matches list view)
        String[] bookAttributes = tabDelimitedBook.split("\t")
        
        if(bookAttributes != null && bookAttributes.size() == 5){
            title = bookAttributes[0]
            author = bookAttributes[1]
            publisher = bookAttributes[2]
            yearOfPub = bookAttributes[3]
            description = bookAttributes[4]
        }else{
            throw new IllegalArgumentException("One of the rows in the uploaded file has an incorrect number of columns.")
        }
        
        if(title!=null && author != null){
            return new Book(title,author,publisher,yearOfPub,description)
        }
        else{
            throw new IllegalArgumentException("One of the entries in the file was missing either the author or the title. This info is required, please either add the nesscary info, or delete the entry from the file and re-upload.")
        }
    }
    public static int ordinalIndexOf(String str, String substr, int n) {
        int pos = str.indexOf(substr);
        while (--n > 0 && pos != -1)
            pos = str.indexOf(substr, pos + 1);
        return pos+1;
    }
    
}

