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
 * @Repository public class BookOrderDaoImpl implements IBookOrderDao {
 * 
 * private final SessionFactory sessionFactory;
 * 
 * @Autowired public BookOrderDaoImpl(SessionFactory sessionFactory) {
 * this.sessionFactory = sessionFactory; }
 * 
 * @Override
 * 
 * @Transactional public boolean saveOrder(List<Book_Order> list) { boolean flag
 * = false; try { Session session = sessionFactory.getCurrentSession(); for
 * (Book_Order b : list) { session.saveOrUpdate(b); } flag = true; } catch
 * (Exception e) { e.printStackTrace(); } return flag; }
 * 
 * @Override
 * 
 * @Transactional(readOnly = true) public List<Book_Order> getBook(String email)
 * { try { Session session = sessionFactory.getCurrentSession();
 * Query<Book_Order> query =
 * session.createQuery("FROM Book_Order WHERE email = :email",
 * Book_Order.class); query.setParameter("email", email); return query.list(); }
 * catch (Exception e) { e.printStackTrace(); } return null; }
 * 
 * @Override
 * 
 * @Transactional(readOnly = true) public List<Book_Order> getAllOrderedBook() {
 * try { Session session = sessionFactory.getCurrentSession(); return
 * session.createQuery("FROM Book_Order", Book_Order.class).list(); } catch
 * (Exception e) { e.printStackTrace(); } return null; } }
 */


package project.Main;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class BookOrderDaoImpl implements IBookOrderDao {

    private final HibernateTemplate hibernateTemplate;

    @Autowired
    public BookOrderDaoImpl(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    public boolean saveOrder(final List<Book_Order> list) {
        try {
            hibernateTemplate.executeWithNativeSession(new HibernateCallback<Object>() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException {
				    for (Book_Order b : list) {
				        session.saveOrUpdate(b);
				    }
				    return null;
				}
			});
            return true;
        } catch (Exception e) {
            handleException("Error saving order", e);
            return false;
        }
    }

    @Override
    public List<Book_Order> getBook(String email) {
        try {
            return (List<Book_Order>) hibernateTemplate.findByNamedQueryAndNamedParam(
                    "Book_Order.findByEmail",
                    "email",
                    email
            );
        } catch (Exception e) {
            handleException("Error retrieving books by email", e);
            return null;
        }
    }

    @Override
    public List<Book_Order> getAllOrderedBook() {
        try {
            return hibernateTemplate.loadAll(Book_Order.class);
        } catch (Exception e) {
            handleException("Error retrieving all ordered books", e);
            return null;
        }
    }

    private void handleException(String message, Exception e) {
        System.err.println(message);
        e.printStackTrace();
    }
}
