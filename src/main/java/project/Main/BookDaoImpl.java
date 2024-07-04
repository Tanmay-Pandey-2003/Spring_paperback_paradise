package project.Main;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDaoImpl implements IBookDao {
	@Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean addBook(BookDetails b) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(b);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                try {
                    transaction.rollback();
                } catch (RuntimeException rbEx) {
                    e.printStackTrace();
                }
            }
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<BookDetails> getAllBooks() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM BookDetails", BookDetails.class).list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public BookDetails getBookById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(BookDetails.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public BookDetails getBookByPhotoName(String photoName) {
        try (Session session = sessionFactory.openSession()) {
            Query<BookDetails> query = session.createQuery(
                    "FROM BookDetails WHERE photoName = :photoName", BookDetails.class);
            query.setParameter("photoName", photoName);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public boolean updateEditBooks(BookDetails b) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(b);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                try {
                    transaction.rollback();
                } catch (RuntimeException rbEx) {
                    e.printStackTrace();
                }
            }
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteBooks(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            BookDetails b = session.get(BookDetails.class, id);
            if (b != null) {
                session.delete(b);
                transaction.commit();
                return true;
            }
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                try {
                    transaction.rollback();
                } catch (RuntimeException rbEx) {
                    e.printStackTrace();
                }
            }
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<BookDetails> getNewBooks() {
        try (Session session = sessionFactory.openSession()) {
            Query<BookDetails> query = session.createQuery(
                    "FROM BookDetails WHERE bookCategory = :category AND status = :status ORDER BY bookId DESC",
                    BookDetails.class);
            query.setParameter("category", "New Book");
            query.setParameter("status", "Active");
            query.setMaxResults(4); // Limit to 4 results
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<BookDetails> getOldBooks() {
        try (Session session = sessionFactory.openSession()) {
            Query<BookDetails> query = session.createQuery(
                    "FROM BookDetails WHERE bookCategory = :category AND status = :status ORDER BY bookId DESC",
                    BookDetails.class);
            query.setParameter("category", "Old Book");
            query.setParameter("status", "Active");
            query.setMaxResults(4); // Limit to 4 results
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<BookDetails> getAllNewBooks() {
        try (Session session = sessionFactory.openSession()) {
            Query<BookDetails> query = session.createQuery(
                    "FROM BookDetails WHERE bookCategory = :category AND status = :status ORDER BY bookId DESC",
                    BookDetails.class);
            query.setParameter("category", "New Book");
            query.setParameter("status", "Active");
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<BookDetails> getAllOldBooks() {
        try (Session session = sessionFactory.openSession()) {
            Query<BookDetails> query = session.createQuery(
                    "FROM BookDetails WHERE bookCategory = :category AND status = :status ORDER BY bookId DESC",
                    BookDetails.class);
            query.setParameter("category", "Old Book");
            query.setParameter("status", "Active");
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<BookDetails> getBooksBySearch(String ch) {
        try (Session session = sessionFactory.openSession()) {
            Query<BookDetails> query = session.createQuery(
                    "FROM BookDetails WHERE (bookName LIKE :search OR author LIKE :search OR bookCategory LIKE :search) AND status = :status",
                    BookDetails.class);
            query.setParameter("search", "%" + ch + "%");
            query.setParameter("status", "Active");
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
