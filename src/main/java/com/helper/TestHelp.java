package com.helper;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entities.Product;

public class TestHelp {
	public static void main(String[] args) {
		Session session = FactoryProvider.getFactory().openSession();
		Query<Product> query = session.createQuery("from Product", Product.class);
		List<Product> list = query.getResultList();

		for (Product product : list) {
			product.setpDesc(product.getpDesc().replace("<br>", ""));
		}
		session.beginTransaction().commit();
		session.close();
		System.out.println("Success");
	}
}
