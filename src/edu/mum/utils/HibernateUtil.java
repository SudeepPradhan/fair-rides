package edu.mum.utils;

//
//import org.hibernate.SessionFactory;
//import org.hibernate.cfg.Configuration;
//
//public class HibernateUtil {
//	private static final SessionFactory sessionFactory;
//	static {
//		try {
//			sessionFactory = new Configuration().configure()
//					.buildSessionFactory();
//		} catch (Throwable ex) {
//			System.err.println("SessionFactory creation failed" + ex);
//			throw new ExceptionInInitializerError(ex);
//		}
//	}
//
//	public static SessionFactory getSessionFactory() {
//		return sessionFactory;
//	}
//}

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {

    private static final SessionFactory sessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
            return new AnnotationConfiguration().configure().buildSessionFactory();

        }
        catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    public static Session getSession() throws HibernateException {         
    	   Session sess = null;       
    	   try {         
    	       sess = sessionFactory.getCurrentSession();  
    	   } catch (org.hibernate.HibernateException he) {  
    	       sess = sessionFactory.openSession();     
    	   }             
    	   return sess;
    	} 

    public static void shutdown() {
    	// Close caches and connection pools
    	getSessionFactory().close();
    }

}
