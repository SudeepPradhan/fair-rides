package edu.mum.services;

 import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import edu.mum.models.Post;
import edu.mum.utils.HibernateUtil;

public class ContentService {
	SessionFactory sf;
	public ContentService() {
		this.sf=HibernateUtil.getSessionFactory();
	}

	public List<Post> getPosts(int postType,int offset, int size) {
		Session session = sf.getCurrentSession();
		Transaction transaction = null;
		List<Post> posts = null;
		try {

			transaction = session.getTransaction();
			transaction.begin();
			
			Query query = session.createQuery("FROM Post where posttype="+postType+" ORDER BY postid DESC");
			query.setFirstResult(offset);
			query.setMaxResults(size);
			
			posts = query.list();

			System.out.println(postType);
			
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return posts;
	}
}
