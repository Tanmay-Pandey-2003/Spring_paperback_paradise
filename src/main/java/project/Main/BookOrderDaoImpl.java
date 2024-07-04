package project.Main;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookOrderDaoImpl implements IBookOrderDao {
	@Autowired
    private SessionFactory sessionFactory;

    
    @Override
    public boolean saveOrder(List<Book_Order> list) {
        boolean flag = false;
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            for (Book_Order b : list) {
                session.saveOrUpdate(b);
            }
            transaction.commit();
            flag = true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public List<Book_Order> getBook(String email) {
        try (Session session = sessionFactory.openSession()) {
            Query<Book_Order> query = session.createQuery("FROM Book_Order WHERE email = :email", Book_Order.class);
            query.setParameter("email", email);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Book_Order> getAllOrderedBook() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Book_Order", Book_Order.class).list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
