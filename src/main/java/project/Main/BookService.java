package project.Main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {
    @Autowired
    private IBookDao bookDao;
    
    @Autowired
    private IBookOrderDao bookOrderDao;
    
    @Autowired
    private ICartDao cartDao;

    public List<BookDetails> getNewBooks() {
        return bookDao.getNewBooks();
    }

    public List<BookDetails> getOldBooks() {
        return bookDao.getOldBooks();
    }
    public List<BookDetails> getAllNewBooks() {
    	return bookDao.getAllNewBooks();
    }
    
    public List<BookDetails> getAllOldBooks(){
    	return bookDao.getAllOldBooks();
    } 
    public List<BookDetails> getAllBooks(){
    	return bookDao.getAllBooks();
    }
    
    public BookDetails getBookById(int id){
    	return bookDao.getBookById(id);
    }
    
    public BookDetails getBookByPhotoName(String photoName) {
        return bookDao.getBookByPhotoName(photoName);
    }
    
    public List<BookDetails> getBooksBySearch(String ch){
    	return bookDao.getBooksBySearch(ch);
    }
    
    public List<Book_Order> getAllOrderedBook(){
    	return bookOrderDao.getAllOrderedBook();
    }
    
    public List<Book_Order> getBook(String email){
    	return bookOrderDao.getBook(email);
    }
    public List<Cart> getBookByUser(int userId) {
    	return cartDao.getBookByUser(userId);
    }
}
