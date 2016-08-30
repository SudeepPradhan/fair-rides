package edu.mum.services;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import edu.mum.models.User;
 
public class UserService {

	public UserService() {

	}

	/**
	 * Save User
	 * 
	 * @param user
	 * @return
	 */
	public User saveUser(User user) {
		 
		try {
			// 1. configuring hibernate
						Configuration configuration = new Configuration().configure();

						// 2. create sessionfactory
						SessionFactory sessionFactory = configuration.buildSessionFactory();

						// 3. Get Session object
						Session session = sessionFactory.openSession();

						// 4. Starting Transaction
						Transaction transaction = session.beginTransaction();
			session.save(user);
			transaction.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return user;
	}

	/**
	 * Check user by email and password
	 * 
	 * @param email
	 * @param passmd5
	 * @return
	 */
	public boolean checkUser(String email, String passmd5) {

		try {
			// 1. configuring hibernate
			Configuration configuration = new Configuration().configure();

			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			// 3. Get Session object
			Session session = sessionFactory.openSession();

			// 4. Starting Transaction
			Transaction transaction = session.beginTransaction();
			Query query = (Query) session.createQuery("from User where email='"
					+ email + "' AND password='" + passmd5 + "'");
			List<User> results = query.getResultList();
			if (results.isEmpty())
				return false;
			else if (results.size() == 1)
				return true;
			transaction.commit();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;

	}

	/**
	 * Get User by email and password
	 * 
	 * @param email
	 * @param passmd5
	 * @return
	 */
	public User getUser(String email, String passmd5) {
		 
		try {// 1. configuring hibernate
			Configuration configuration = new Configuration().configure();

			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			// 3. Get Session object
			Session session = sessionFactory.openSession();

			// 4. Starting Transaction
			Transaction transaction = session.beginTransaction();
			Query query = (Query) session
					.createQuery(
							"FROM User where email='" + email
									+ "' AND password='" + passmd5 + "'");
			List<User> results = query.getResultList();

			if (results.size() == 1) {
				return results.get(0);
			}
			transaction.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public User getUserByEmail(String email) {
 		try {
 		// 1. configuring hibernate
 					Configuration configuration = new Configuration().configure();

 					// 2. create sessionfactory
 					SessionFactory sessionFactory = configuration.buildSessionFactory();

 					// 3. Get Session object
 					Session session = sessionFactory.openSession();

 					// 4. Starting Transaction
 					Transaction transaction = session.beginTransaction();
			Query query = (Query)session
					.createQuery(
							"FROM User where email='" + email + "'  ");
			List<User> results = query.getResultList();

			if (results.size() == 1) {
				return results.get(0);
			}
			transaction.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
