/*
 * package project.Main;
 * 
 * import java.util.List;
 * 
 * import org.hibernate.Session; import org.hibernate.SessionFactory; import
 * org.hibernate.query.Query; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Repository; import
 * org.springframework.transaction.annotation.Transactional;
 * 
 * @Repository public class CartDaoImpl implements ICartDao {
 * 
 * private final SessionFactory sessionFactory;
 * 
 * @Autowired public CartDaoImpl(SessionFactory sessionFactory) {
 * this.sessionFactory = sessionFactory; }
 * 
 * @Override
 * 
 * @Transactional public String addCart(Cart c) { try { Session session =
 * sessionFactory.getCurrentSession(); session.save(c); return c.getCategory();
 * // Assuming category is returned on success } catch (Exception e) {
 * e.printStackTrace(); return "fail"; } }
 * 
 * @Override
 * 
 * @Transactional(readOnly = true) public List<Cart> getBookByUser(int userId) {
 * try { Session session = sessionFactory.getCurrentSession(); Query<Cart> query
 * = session.createQuery("FROM Cart WHERE userId = :userId", Cart.class);
 * query.setParameter("userId", userId); List<Cart> list = query.list(); double
 * totalPrice = 0; for (Cart c : list) { totalPrice += c.getTotalPrice();
 * c.setTotalPrice(totalPrice); } return list; } catch (Exception e) {
 * e.printStackTrace(); return null; } }
 * 
 * @Override
 * 
 * @Transactional public boolean deleteBook(int bid, int cid, int uid) { try {
 * Session session = sessionFactory.getCurrentSession(); Query<?> query =
 * session.
 * createQuery("DELETE FROM Cart WHERE bid = :bid AND cid = :cid AND userId = :uid"
 * ); query.setParameter("bid", bid); query.setParameter("cid", cid);
 * query.setParameter("uid", uid); int rowsAffected = query.executeUpdate();
 * return rowsAffected >= 1; } catch (Exception e) { e.printStackTrace(); return
 * false; } } }
 */


package project.Main;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@Repository
@Transactional
public class CartDaoImpl implements ICartDao {

    private final HibernateTemplate hibernateTemplate;

    @Autowired
    public CartDaoImpl(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    @Transactional
    public String addCart(Cart c) {
        try {
            hibernateTemplate.save(c);
            return c.getCategory(); // Assuming category is returned on success
        } catch (Exception e) {
            handleException("Error adding cart item", e);
            return "fail";
        }
    }

    @Override
    @Transactional
    public List<Cart> getBookByUser(int userId) {
        try {
            return (List<Cart>) hibernateTemplate.findByNamedQueryAndNamedParam(
                    "Cart.findByUserId",
                    "userId",
                    userId
            );
        } catch (Exception e) {
            handleException("Error retrieving cart items by user ID", e);
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    public boolean deleteBook(final int bid, final int cid, final int uid) {
        try {
            int rowsAffected = hibernateTemplate.executeWithNativeSession(new HibernateCallback<Integer>() {
				@Override
				public Integer doInHibernate(Session session) throws HibernateException {
				    org.hibernate.query.Query<?> query = session.createQuery(
				            "DELETE FROM Cart WHERE bid = :bid AND cid = :cid AND userId = :uid");
				    query.setParameter("bid", bid);
				    query.setParameter("cid", cid);
				    query.setParameter("uid", uid);
				    return query.executeUpdate();
				}
			});
            return rowsAffected >= 1;
        } catch (Exception e) {
            handleException("Error deleting cart item", e);
            return false;
        }
    }

    private void handleException(String message, Exception e) {
        System.err.println(message);
        e.printStackTrace();
    }
}
