package edu.mum.services;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import edu.mum.models.Post;
 
public class PostService {

	public PostService() {

	}

	/**
	 * Save Post
	 * 
	 * @param post
	 * @return
	 */
	public Post savePost(Post post) {
		 
		try {
			// 1. configuring hibernate
						Configuration configuration = new Configuration().configure();

						// 2. create sessionfactory
						SessionFactory sessionFactory = configuration.buildSessionFactory();

						// 3. Get Session object
						Session session = sessionFactory.openSession();

						// 4. Starting Transaction
						Transaction transaction = session.beginTransaction();
			session.save(post);
			transaction.commit();
		} catch (Exception e) {
			// TODO: handle exception
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
		 
		try {// 1. configuring hibernate
			Configuration configuration = new Configuration().configure();

			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			// 3. Get Session object
			Session session = sessionFactory.openSession();

			// 4. Starting Transaction
			Transaction transaction = session.beginTransaction();
			Query query = (Query) session
					.createQuery("FROM posts where postid='" + postId	+ "'");
			List<Post> results = query.getResultList();
			
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
