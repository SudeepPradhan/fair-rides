package edu.mum.services;


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

}
