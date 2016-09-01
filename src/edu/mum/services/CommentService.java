package edu.mum.services;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import edu.mum.models.Comment;
import edu.mum.models.Like;
import edu.mum.models.Post;
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

	/**
	 * Get last comment
	 * @return
	 */
	public Comment getLastComment() {
		Session session = sf.getCurrentSession();
		Transaction transaction = null;
		Comment comment = null;List<Comment> comments = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			Query query = session.createQuery("FROM Comment ORDER BY commentid DESC");
			query.setMaxResults(1);
			
			comments = query.list();
			if(comments.size()>0){
				comment=comments.get(0);
			}
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
