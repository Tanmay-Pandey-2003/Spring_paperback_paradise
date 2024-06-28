/*
 * package project.Main;
 * 
 * import org.hibernate.Session; import org.hibernate.SessionFactory; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Repository; import
 * org.springframework.transaction.annotation.Transactional;
 * 
 * import javax.persistence.criteria.CriteriaBuilder; import
 * javax.persistence.criteria.CriteriaQuery; import
 * javax.persistence.criteria.Path; import javax.persistence.criteria.Root;
 * import java.util.Collections; import java.util.List;
 * 
 * @Repository
 * 
 * @Transactional public class BookDaoImpl implements IBookDao {
 * 
 * private final SessionFactory sessionFactory;
 * 
 * @Autowired public BookDaoImpl(SessionFactory sessionFactory) {
 * this.sessionFactory = sessionFactory; }
 * 
 * 
 * @Override public boolean addBook(BookDetails b) { try { Session session =
 * sessionFactory.getCurrentSession(); session.save(b); return true; } catch
 * (Exception e) { handleException("Error adding book", e); return false; } }
 * 
 * @Override public List<BookDetails> getAllBooks() { try { Session session =
 * sessionFactory.getCurrentSession(); CriteriaBuilder cb =
 * session.getCriteriaBuilder(); CriteriaQuery<BookDetails> cq =
 * cb.createQuery(BookDetails.class); Root<BookDetails> root =
 * cq.from(BookDetails.class); cq.select(root); return
 * session.createQuery(cq).getResultList(); } catch (Exception e) {
 * handleException("Error retrieving all books", e); return
 * Collections.emptyList(); } }
 * 
 * @Override public BookDetails getBookById(int id) { try { Session session =
 * sessionFactory.getCurrentSession(); return session.get(BookDetails.class,
 * id); } catch (Exception e) { handleException("Error retrieving book by ID",
 * e); return null; } }
 * 
 * @Override public boolean updateEditBooks(BookDetails b) { try { Session
 * session = sessionFactory.getCurrentSession(); session.update(b); return true;
 * } catch (Exception e) { handleException("Error updating book", e); return
 * false; } }
 * 
 * @Override public boolean deleteBooks(int id) { try { Session session =
 * sessionFactory.getCurrentSession(); BookDetails b =
 * session.get(BookDetails.class, id); if (b != null) { session.delete(b);
 * return true; } return false; } catch (Exception e) {
 * handleException("Error deleting book", e); return false; } }
 * 
 * @Override public List<BookDetails> getNewBooks() { try { Session session =
 * sessionFactory.getCurrentSession(); CriteriaBuilder cb =
 * session.getCriteriaBuilder(); CriteriaQuery<BookDetails> cq =
 * cb.createQuery(BookDetails.class); Root<BookDetails> root =
 * cq.from(BookDetails.class);
 * cq.select(root).where(cb.and(cb.equal(root.get("bookCategory"), "New Book"),
 * cb.equal(root.get("status"), "Active")))
 * .orderBy(cb.desc(root.get("bookId"))); return
 * session.createQuery(cq).setMaxResults(4).getResultList(); } catch (Exception
 * e) { handleException("Error retrieving new books", e); return
 * Collections.emptyList(); } }
 * 
 * @Override public List<BookDetails> getOldBooks() { try { Session session =
 * sessionFactory.getCurrentSession(); CriteriaBuilder cb =
 * session.getCriteriaBuilder(); CriteriaQuery<BookDetails> cq =
 * cb.createQuery(BookDetails.class); Root<BookDetails> root =
 * cq.from(BookDetails.class);
 * cq.select(root).where(cb.and(cb.equal(root.get("bookCategory"), "Old Book"),
 * cb.equal(root.get("status"), "Active")))
 * .orderBy(cb.desc(root.get("bookId"))); return
 * session.createQuery(cq).setMaxResults(4).getResultList(); } catch (Exception
 * e) { handleException("Error retrieving old books", e); return
 * Collections.emptyList(); } }
 * 
 * @Override public List<BookDetails> getAllNewBooks() { try { Session session =
 * sessionFactory.getCurrentSession(); CriteriaBuilder cb =
 * session.getCriteriaBuilder(); CriteriaQuery<BookDetails> cq =
 * cb.createQuery(BookDetails.class); Root<BookDetails> root =
 * cq.from(BookDetails.class);
 * cq.select(root).where(cb.equal(root.get("bookCategory"), "New Book"),
 * cb.equal(root.get("status"), "Active"))
 * .orderBy(cb.desc(root.get("bookId"))); return
 * session.createQuery(cq).getResultList(); } catch (Exception e) {
 * handleException("Error retrieving all new books", e); return
 * Collections.emptyList(); } }
 * 
 * @Override public List<BookDetails> getAllOldBooks() { try { Session session =
 * sessionFactory.getCurrentSession(); CriteriaBuilder cb =
 * session.getCriteriaBuilder(); CriteriaQuery<BookDetails> cq =
 * cb.createQuery(BookDetails.class); Root<BookDetails> root =
 * cq.from(BookDetails.class);
 * cq.select(root).where(cb.equal(root.get("bookCategory"), "Old Book"),
 * cb.equal(root.get("status"), "Active"))
 * .orderBy(cb.desc(root.get("bookId"))); return
 * session.createQuery(cq).getResultList(); } catch (Exception e) {
 * handleException("Error retrieving all old books", e); return
 * Collections.emptyList(); } }
 * 
 * @Override public List<BookDetails> getBooksBySearch(String ch) { try {
 * Session session = sessionFactory.getCurrentSession(); CriteriaBuilder cb =
 * session.getCriteriaBuilder(); CriteriaQuery<BookDetails> cq =
 * cb.createQuery(BookDetails.class); Root<BookDetails> root =
 * cq.from(BookDetails.class);
 * 
 * // Convert paths to Path<String> Path<String> bookNamePath =
 * root.get("bookName"); Path<String> authorPath = root.get("author");
 * Path<String> bookCategoryPath = root.get("bookCategory");
 * 
 * cq.select(root).where(cb.and( cb.or(cb.like(bookNamePath, "%" + ch + "%"),
 * cb.like(authorPath, "%" + ch + "%"), cb.like(bookCategoryPath, "%" + ch +
 * "%")), cb.equal(root.get("status"), "Active"))); return
 * session.createQuery(cq).getResultList(); } catch (Exception e) {
 * handleException("Error searching books", e); return Collections.emptyList();
 * } }
 * 
 * private void handleException(String message, Exception e) {
 * System.err.println(message); e.printStackTrace(); } }
 */


package project.Main;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Collections;
import java.util.List;

@Repository
@Transactional
public class BookDaoImpl implements IBookDao {

    private final HibernateTemplate hibernateTemplate;

    @Autowired
    public BookDaoImpl(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    @Transactional
    public boolean addBook(BookDetails b) {
        try {
            hibernateTemplate.save(b);
            return true;
        } catch (Exception e) {
            handleException("Error adding book", e);
            return false;
        }
    }

    @Override
    @Transactional
    public List<BookDetails> getAllBooks() {
        try {
            return hibernateTemplate.loadAll(BookDetails.class);
        } catch (Exception e) {
            handleException("Error retrieving all books", e);
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    public BookDetails getBookById(int id) {
        try {
            return hibernateTemplate.get(BookDetails.class, id);
        } catch (Exception e) {
            handleException("Error retrieving book by ID", e);
            return null;
        }
    }

    @Override
    @Transactional
    public boolean updateEditBooks(BookDetails b) {
        try {
            hibernateTemplate.update(b);
            return true;
        } catch (Exception e) {
            handleException("Error updating book", e);
            return false;
        }
    }

    @Override
    @Transactional
    public boolean deleteBooks(int id) {
        try {
            BookDetails b = hibernateTemplate.get(BookDetails.class, id);
            if (b != null) {
                hibernateTemplate.delete(b);
                return true;
            }
            return false;
        } catch (Exception e) {
            handleException("Error deleting book", e);
            return false;
        }
    }

    @SuppressWarnings("unchecked")
	@Override
    @Transactional
    public List<BookDetails> getNewBooks() {
        try {
            return (List<BookDetails>) hibernateTemplate.findByNamedQueryAndNamedParam(
                    "BookDetails.findNewBooks",
                    new String[]{"bookCategory", "status"},
                    new Object[]{"New Book", "Active"}
            );
        } catch (Exception e) {
            handleException("Error retrieving new books", e);
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    public List<BookDetails> getOldBooks() {
        try {
            return (List<BookDetails>) hibernateTemplate.findByNamedQueryAndNamedParam(
                    "BookDetails.findOldBooks",
                    new String[]{"bookCategory", "status"},
                    new Object[]{"Old Book", "Active"}
            );
        } catch (Exception e) {
            handleException("Error retrieving old books", e);
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    public List<BookDetails> getAllNewBooks() {
        try {
            return (List<BookDetails>) hibernateTemplate.findByNamedQueryAndNamedParam(
                    "BookDetails.findNewBooks",
                    new String[]{"status"},
                    new Object[]{"Active"}
            );
        } catch (Exception e) {
            handleException("Error retrieving all new books", e);
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    public List<BookDetails> getAllOldBooks() {
        try {
            return (List<BookDetails>) hibernateTemplate.findByNamedQueryAndNamedParam(
                    "BookDetails.findOldBooks",
                    new String[]{"status"},
                    new Object[]{"Active"}
            );
        } catch (Exception e) {
            handleException("Error retrieving all old books", e);
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    public List<BookDetails> getBooksBySearch(final String ch) {
        try {
            return hibernateTemplate.execute(new HibernateCallback<List<BookDetails>>() {
				@Override
				public List<BookDetails> doInHibernate(Session session) throws HibernateException {
				    return session.createQuery(
				            "SELECT b FROM BookDetails b WHERE " +
				                    "(LOWER(b.bookName) LIKE :searchTerm OR " +
				                    "LOWER(b.author) LIKE :searchTerm OR " +
				                    "LOWER(b.bookCategory) LIKE :searchTerm) AND " +
				                    "b.status = 'Active'", BookDetails.class)
				            .setParameter("searchTerm", "%" + ch.toLowerCase() + "%")
				            .getResultList();
				}
			});
        } catch (Exception e) {
            handleException("Error searching books", e);
            return Collections.emptyList();
        }
    }

    private void handleException(String message, Exception e) {
        System.err.println(message);
        e.printStackTrace();
    }
}
