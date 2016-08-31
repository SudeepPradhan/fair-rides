package edu.mum.services;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import edu.mum.models.Like;
import edu.mum.utils.HibernateUtil;

public class LikeService {

	private SessionFactory sf;
	public LikeService() {
		this.sf=HibernateUtil.getSessionFactory();

	}

	/**
	 * Save Like
	 * 
	 * @param like
	 * @return
	 */
	public Like saveLike(Like like) {
		Session session = sf.getCurrentSession();
		Transaction transaction = null;
		try {

			transaction = session.getTransaction();
			transaction.begin();
			session.save(like);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return like;
	}
}
