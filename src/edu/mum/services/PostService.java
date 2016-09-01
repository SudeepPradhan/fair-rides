package edu.mum.services;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import edu.mum.models.Post;
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

	/**
	 * GET LAST POST
	 * @return
	 */
	public Post getLastPost(int posttype) {
		Session session = sf.getCurrentSession();
		Transaction transaction = null;
		Post post = null;List<Post> posts = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			Query query = session.createQuery("FROM Post where posttype="+posttype+" ORDER BY postid DESC");
			query.setMaxResults(1);
			
			posts = query.list();
			if(posts.size()>0){
				post=posts.get(0);
			}
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return post;
	}

	
}
