package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.Product;
import com.helper.FactoryProvider;

public class ProductDao {
	SessionFactory factory = null;

	public ProductDao() {
		try {
			this.factory = FactoryProvider.getFactory();
		} catch (Exception e) {
			System.out.println("Unable to initialize factory");
			e.printStackTrace();
		}
	}

	// Add new Product
	public boolean addProduct(Product product) {
		try {
			Session hiberSession = this.factory.openSession();
			hiberSession.save(product);
			hiberSession.beginTransaction().commit();
			hiberSession.close();
			return true;

		} catch (Exception e) {
			System.out.println("Unable to add product");
			e.printStackTrace();
			return false;
		}
	}

	// Get products by CategoryId
	public List<Product> getProductsByCategoryId(int categoryId) {
		List<Product> list = null;
		try {
			Session hiberSession = this.factory.openSession();
			String queryString = "from Product as p where p.pCategory.categoryId = :id";
			Query<Product> query = hiberSession.createQuery(queryString, Product.class);
			query.setParameter("id", categoryId);
			list = query.getResultList();
			hiberSession.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	// Get products by title
	public List<Product> getProductsByCategoryTitle(String categoryTitle) {
		return null;
	}

	// Get List of Product
	public List<Product> getProducts() {
		try {
			Session hiberSession = this.factory.openSession();
			String queryString = "from Product";
			Query<Product> query = hiberSession.createQuery(queryString, Product.class);

			List<Product> list = query.getResultList();
			hiberSession.close();
			return list;
		} catch (Exception e) {
			System.out.println("Unable to return Product");
			e.printStackTrace();
		}
		return null;
	}

	//	Get no. of products
	public int getProductsNo() {
		try {
			Session session = factory.openSession();
			Query<Product> query = session.createQuery("from Product", Product.class);
			int productNo = query.getResultList().size();
			session.close();
			return productNo;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
