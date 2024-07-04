package project.Main;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserDaoImpl implements IUserDao {
	@Autowired
    private SessionFactory sessionFactory;

   

    @Override
    public boolean userRegister(User user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(user); // Save the user object
            transaction.commit(); // Commit the transaction
            return true; // Return true if successful
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); // Rollback transaction on exception
            }
            e.printStackTrace();
            return false; // Return false if an exception occurs
        }
    }

    @Override
    public User login(String email, String password) {
        try (Session session = sessionFactory.openSession()) {
            Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
            query.setParameter("email", email);
            User user = query.uniqueResult();
            if (user != null && user.getPassword().equals(password)) {
                return user; // Return user if found and password matches
            } else {
                return null; // Return null if user not found or password doesn't match
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Return null on exception
        }
    }

    @Override
    public boolean checkpassword(int id, String password) {
        try (Session session = sessionFactory.openSession()) {
            User user = session.get(User.class, id); // Get user by id
            if (user != null && user.getPassword().equals(password)) {
                return true; // Return true if password matches
            } else {
                return false; // Return false if user not found or password doesn't match
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Return false on exception
        }
    }

    @Override
    public boolean updateProfile(User user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();

            // Retrieve the existing user entity
            User existingUser = session.get(User.class, user.getId());
            if (existingUser == null) {
                // Handle case where user does not exist
                return false; // Return false if user not found
            }

            // Update user fields
            if (user.getName() != null) {
                existingUser.setName(user.getName());
            }
            if (user.getEmail() != null) {
                existingUser.setEmail(user.getEmail());
            }
            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                existingUser.setPassword(user.getPassword());
            }
            if (user.getPhno() != null) {
                existingUser.setPhno(user.getPhno());
            }
            // Merge updated user entity
            session.merge(existingUser);

            transaction.commit();
            return true; // Return true if update successful
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); // Rollback transaction on exception
            }
            e.printStackTrace();
            return false; // Return false if an exception occurs
        }
    }

    @Override
    public boolean checkUser(String email) {
        try (Session session = sessionFactory.openSession()) {
            Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
            query.setParameter("email", email);
            return query.uniqueResult() != null; // Return true if user exists
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Return false on exception
        }
    }
}


