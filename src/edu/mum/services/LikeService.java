package edu.mum.services;

import java.util.List;

import org.hibernate.Query;
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

	/**
	 * Get Last Like
	 * @return
	 */
	public Like getLastLike() {
		Session session = sf.getCurrentSession();
		Transaction transaction = null;
		Like like = null;List<Like> likes = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			Query query = session.createQuery("FROM Like ORDER BY likeid DESC");
			query.setMaxResults(1);
			
			likes = query.list();
			if(likes.size()>0){
				like=likes.get(0);
			}
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
