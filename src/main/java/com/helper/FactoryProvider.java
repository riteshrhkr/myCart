package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	public static SessionFactory factory = null;

	public static SessionFactory getFactory() {
		if (factory == null) {
			try {
				factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			} catch (Exception e) {
				System.out.println("Error While creating SessionFactory");
				e.printStackTrace();
			}
		}
		return factory;
	}

	public void closeFactory() {
		if (factory.isOpen()) {
			factory.close();
		}
	}

}
