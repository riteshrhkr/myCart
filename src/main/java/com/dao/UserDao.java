package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.User;
import com.helper.FactoryProvider;

public class UserDao {
	private SessionFactory factory = null;

	public UserDao() {
		try {
			this.factory = FactoryProvider.getFactory();
		} catch (Exception e) {
			System.out.println("Unalbe to initilize session factory in UserDao");
			e.printStackTrace();
		}
	}

	public User getUser(String userEmail, String userPassword) {
		User user = null;
		try {
			String queyString = "select u from User u where u.userEmail = :e and u.userPassword = :p";
			Session hiberSession = factory.openSession();

			Query<User> query = hiberSession.createQuery(queyString, User.class);
			query.setParameter("e", userEmail);
			query.setParameter("p", userPassword);
			user = query.uniqueResult();

			hiberSession.close();
		} catch (Exception e) {
			System.out.println("User does'nt exist in database");
			e.printStackTrace();
		}
		return user;
	}

	public boolean addUser(User user) {

		try {
			Session hiberSession = factory.openSession();
			hiberSession.save(user);
			hiberSession.beginTransaction().commit();
			hiberSession.close();
			return true;

		} catch (Exception e) {
			System.out.println("Faild to add New user");
			e.printStackTrace();
			return false;
		}
	}

	public boolean userExist(String email) {
		try {
			Session hiberSession = factory.openSession();
			String queryString = "select u from User as u where u.userEmail = :e";
			Query<User> query = hiberSession.createQuery(queryString, User.class);
			query.setParameter("e", email);
			List<User> user = query.getResultList();
			System.out.println("User = " + user);
			if (user == null || user.size() == 0) {
				return false;
			}
			return true;

		} catch (Exception e) {
			System.out.println("User does'nt exist File:- UserDao");
			e.printStackTrace();
			return false;
		}
	}

	//	Get no. of users
	public int getUsersNo() {
		try {
			Session session = factory.openSession();
			Query<User> query = session.createQuery("from User", User.class);
			int userNo = query.getResultList().size();
			session.close();
			return userNo;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
