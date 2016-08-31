package edu.mum.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.transform.ResultTransformer;
import org.hibernate.transform.RootEntityResultTransformer;

import edu.mum.models.Post;
import edu.mum.models.User;
import edu.mum.utils.HibernateUtil;

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
		Session session = HibernateUtil.getSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(user);
			transaction.commit();
			System.out.println("Records inserted sucessessfully");
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
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
	public User checkUser(String email, String passmd5) {
		Session session = HibernateUtil.getSession();
		Transaction transaction = null;
		User user = null;
		try {

			transaction = session.getTransaction();
			transaction.begin();
			@SuppressWarnings("unchecked")
			List<User> users = session.createQuery(
					"from User where email='" + email + "' AND password='"
							+ passmd5 + "'").list();
			System.out.println("user: " + users.size());
			if (null != users && users.size() > 0) {
				user = users.get(0);
				System.out.println("user email: " + user.getEmail());
			}
			transaction.commit();

		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return user;
	}

	/**
	 * Get User by email and password
	 * 
	 * @param email
	 * @param passmd5
	 * @return
	 */
	public User getUser(String email, String passmd5) {
		Session session = HibernateUtil.getSession();
		Transaction transaction = null;
		User user = null;
		try {
			transaction = session.beginTransaction();
			SQLQuery query = session.createSQLQuery("from User where email='"
					+ email + "' AND password='" + passmd5 + "'");
			List<User> results = query.list();
			System.out.println("get user: " + results.size());

			if (results.size() > 0) {
				System.out.println("get user: " + results.get(0).getEmail());
				user = results.get(0);
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return user;
	}

	/**
	 * Get User by Email
	 * 
	 * @param email
	 * @return
	 */
	public User getUserByEmail(String email) {
		Session session = HibernateUtil.getSession();
		Transaction transaction = null;
		User user = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			@SuppressWarnings("unchecked")
			List<User> results = session.createSQLQuery("from User where email='"
					+ email + "'  ").list();
 			if (results.size() > 0) {
				user = results.get(0);
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return user;
	}

	 

	public User getUserByUserId(int userId) {
		Session session = HibernateUtil.getSession();
		Transaction transaction = null;
		User user = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			@SuppressWarnings("unchecked")
			List<User> results = session.createQuery("from User where userid="
					+ userId + "  ").list();
 			if (results.size() > 0) {
				user = results.get(0);
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return user;
	}

}
