package edu.mum.services;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import edu.mum.models.Comment;
import edu.mum.models.Post;
import edu.mum.models.User;
import edu.mum.utils.HibernateUtil;

public class PostService {

	private SessionFactory sf;
	
	public PostService() {
		this.sf=HibernateUtil.getSessionFactory();
	}

	/**
	 * Save Post
	 * 
	 * @param post
	 * @return
	 */
	public Post savePost(Post post) {
		Session session = sf.getCurrentSession();
		Transaction transaction = null;
		try {

			transaction = session.getTransaction();
			transaction.begin();
			session.save(post);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return post;
	}

	/**
	 * Get post by source and destination
	 * 
	 * @param source
	 * @param destination
	 * @return
	 */
	public Post getPost(int postId) {

		Session session = sf.getCurrentSession();
		Transaction transaction = null;
		Post post = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			@SuppressWarnings("unchecked")
			List<Post> results = session.createQuery(
					"from Post where postid=" + postId + "  ").list();
			if (results.size() > 0) {
				post = results.get(0);
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return post;
	}

	
}
