/*
 * package project.Main;
 * 
 * import org.hibernate.Session; import org.hibernate.SessionFactory; import
 * org.hibernate.query.Query; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Repository; import
 * org.springframework.transaction.annotation.Transactional;
 * 
 * @Repository public class UserDaoImpl implements IUserDao {
 * 
 * private final SessionFactory sessionFactory;
 * 
 * @Autowired public UserDaoImpl(SessionFactory sessionFactory) {
 * this.sessionFactory = sessionFactory; // Initialize session factory }
 * 
 * @Override
 * 
 * @Transactional public boolean userRegister(User user) { try { Session session
 * = sessionFactory.getCurrentSession(); session.save(user); // Save the user
 * object return true; // Return true if successful } catch (Exception e) {
 * e.printStackTrace(); return false; // Return false if an exception occurs } }
 * 
 * @Override
 * 
 * @Transactional(readOnly = true) public User login(String email, String
 * password) { try { Session session = sessionFactory.getCurrentSession();
 * Query<User> query = session.createQuery("FROM User WHERE email = :email",
 * User.class); query.setParameter("email", email); User user =
 * query.uniqueResult(); if (user != null &&
 * user.getPassword().equals(password)) { return user; // Return user if found
 * and password matches } else { return null; // Return null if user not found
 * or password doesn't match } } catch (Exception e) { e.printStackTrace();
 * return null; // Return null on exception } }
 * 
 * @Override
 * 
 * @Transactional(readOnly = true) public boolean checkpassword(int id, String
 * password) { try { Session session = sessionFactory.getCurrentSession(); User
 * user = session.get(User.class, id); // Get user by id if (user != null &&
 * user.getPassword().equals(password)) { return true; // Return true if
 * password matches } else { return false; // Return false if user not found or
 * password doesn't match } } catch (Exception e) { e.printStackTrace(); return
 * false; // Return false on exception } }
 * 
 * @Override
 * 
 * @Transactional public boolean updateProfile(User user) { try { Session
 * session = sessionFactory.getCurrentSession();
 * 
 * // Retrieve the existing user entity User existingUser =
 * session.get(User.class, user.getId()); if (existingUser == null) { // Handle
 * case where user does not exist return false; // Return false if user not
 * found }
 * 
 * // Update user fields if (user.getName() != null) {
 * existingUser.setName(user.getName()); } if (user.getEmail() != null) {
 * existingUser.setEmail(user.getEmail()); } if (user.getPassword() != null &&
 * !user.getPassword().isEmpty()) {
 * existingUser.setPassword(user.getPassword()); } if (user.getPhno() != null) {
 * existingUser.setPhno(user.getPhno()); } // Merge updated user entity
 * session.merge(existingUser);
 * 
 * return true; // Return true if update successful } catch (Exception e) {
 * e.printStackTrace(); return false; // Return false if an exception occurs } }
 * 
 * @Override
 * 
 * @Transactional(readOnly = true) public boolean checkUser(String email) { try
 * { Session session = sessionFactory.getCurrentSession(); Query<User> query =
 * session.createQuery("FROM User WHERE email = :email", User.class);
 * query.setParameter("email", email); return query.uniqueResult() != null; //
 * Return true if user exists } catch (Exception e) { e.printStackTrace();
 * return false; // Return false on exception } } }
 */


package project.Main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class UserDaoImpl implements IUserDao {

    private final HibernateTemplate hibernateTemplate;

    @Autowired
    public UserDaoImpl(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    @Transactional
    public boolean userRegister(User user) {
        try {
            hibernateTemplate.save(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


	@Override
    @Transactional(readOnly = true)
    public User login(String email, String password) {
        try {
            @SuppressWarnings("deprecation")
			List<User> users = (List<User>) hibernateTemplate.findByNamedQueryAndNamedParam(
                    "User.findByEmailAndPassword",
                    new String[]{"email", "password"},
                    new Object[]{email, password}
            );
            return !users.isEmpty() ? users.get(0) : null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    @Transactional(readOnly = true)
    public boolean checkpassword(int id, String password) {
        try {
            User user = hibernateTemplate.get(User.class, id);
            return user != null && user.getPassword().equals(password);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional
    public boolean updateProfile(User user) {
        try {
            hibernateTemplate.update(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

  
	@Override
    @Transactional(readOnly = true)
    public boolean checkUser(String email) {
        try {
            List<User> users = (List<User>) hibernateTemplate.findByNamedQueryAndNamedParam(
                    "User.findByEmail",
                    "email",
                    email
            );
            return !users.isEmpty();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


}
