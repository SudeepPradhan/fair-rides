package edu.mum.services;

import java.util.List;

import javax.persistence.Query;

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
		HibernateUtil.getSessionFactory().getCurrentSession().save(user);
		return user;
	}

	/**
	 * Check user by email and password
	 * @param email
	 * @param passmd5
	 * @return
	 */
	public boolean checkUser(String email, String passmd5) {
		Query query = (Query) HibernateUtil
				.getSessionFactory()
				.getCurrentSession()
				.createQuery(
						"SELECT * FROM USER where email='" + email
								+ "' AND password='" + passmd5 + "'");
		List<User> results = query.getResultList();
		if (results.isEmpty())
			return false;
		else if (results.size() == 1)
			return true;
		return false;
	}

	/**
	 * Get User by email and password
	 * @param email
	 * @param passmd5
	 * @return
	 */
	public User getUser(String email, String passmd5) {
		Query query = (Query) HibernateUtil
				.getSessionFactory()
				.getCurrentSession()
				.createQuery(
						"SELECT * FROM USER where email='" + email
								+ "' AND password='" + passmd5 + "'");
		List<User> results = query.getResultList();

		if (results.size() == 1) {
			return results.get(0);
		} else {
			return null;
		}
	}

}
