package project.Main;

import java.util.List;

public interface ICartDao {
	public String addCart(Cart c);
	public List<Cart> getBookByUser(int userId);
	public boolean deleteBook(int bid , int cid , int uid);
}

