package project.Main;

import java.util.List;

public interface IBookOrderDao {
	public boolean saveOrder(List<Book_Order> b);
	public List<Book_Order> getBook(String email);
	public List<Book_Order> getAllOrderedBook();
}
