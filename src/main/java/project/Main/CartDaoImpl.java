package project.Main;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CartDaoImpl implements ICartDao {
	@Autowired
    private SessionFactory sessionFactory;

    
    @Override
    public String addCart(Cart c) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(c);
            transaction.commit();
            return c.getCategory(); // Assuming category is returned on success
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return "fail";
        }
    }

    @Override
    public List<Cart> getBookByUser(int userId) {
        try (Session session = sessionFactory.openSession()) {
            Query<Cart> query = session.createQuery("FROM Cart WHERE userId = :userId", Cart.class);
            query.setParameter("userId", userId);
            List<Cart> list = query.list();
            double totalPrice = 0;
            for (Cart c : list) {
                totalPrice += c.getTotalPrice();
                c.setTotalPrice(totalPrice);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean deleteBook(int bid, int cid, int uid) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Query<?> query = session.createQuery("DELETE FROM Cart WHERE bid = :bid AND cid = :cid AND userId = :uid");
            query.setParameter("bid", bid);
            query.setParameter("cid", cid);
            query.setParameter("uid", uid);
            int rowsAffected = query.executeUpdate();
            transaction.commit();
            return rowsAffected >= 1;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

}
