package edu.mum.services;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import edu.mum.models.Comment;
import edu.mum.utils.HibernateUtil;

public class CommentService {

	private SessionFactory sf;
	public CommentService() {
		this.sf=HibernateUtil.getSessionFactory();

	}

	/**
	 * Save Comment
	 * 
	 * @param comment
	 * @return
	 */
	public Comment saveComment(Comment comment) {
		Session session = sf.getCurrentSession();
		Transaction transaction = null;
		try {

			transaction = session.getTransaction();
			transaction.begin();
			session.save(comment);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return comment;
	}
}
