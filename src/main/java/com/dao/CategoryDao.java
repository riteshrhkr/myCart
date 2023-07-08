package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.Category;
import com.helper.FactoryProvider;

public class CategoryDao {
	SessionFactory factory = null;

	public CategoryDao() {
		try {
			this.factory = FactoryProvider.getFactory();
		} catch (Exception e) {
			System.out.println("Unable to initialize factory");
			e.printStackTrace();
		}
	}

	// add new category

	public boolean addCategory(Category category) {
		try {
			Session hiberSession = this.factory.openSession();
			hiberSession.save(category);

			hiberSession.beginTransaction().commit();
			hiberSession.close();
			return true;
		} catch (Exception e) {
			System.out.println("Faild to add Category");
			e.printStackTrace();
			return false;
		}
	}

	// Return The list of Categories
	public List<Category> getCategories() {
		try {
			Session hiberSession = this.factory.openSession();
			String queryString = "from Category";
			Query<Category> query = hiberSession.createQuery(queryString, Category.class);

			List<Category> list = query.getResultList();
			hiberSession.close();
			return list;
		} catch (Exception e) {
			System.out.println("Unable to return categories");
			e.printStackTrace();
		}
		return null;
	}

	// Get category by its id
	public Category getCategoryById(int id) {
		Category category = null;
		try {
			Session hiberSession = this.factory.openSession();
			category = hiberSession.get(Category.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}

	public boolean categoryExist(String title) {
		try {
			Session hiberSession = factory.openSession();
			String queryString = "from Category c where c.categoryTitle = :t";
			Query<Category> query = hiberSession.createQuery(queryString, Category.class);
			query.setParameter("t", title);
			Category category = query.uniqueResult();
			if (category == null) {
				return false;
			}
			return true;

		} catch (Exception e) {
			System.out.println("Category does'nt exist File:- categoryDao");
			// e.printStackTrace();
			return false;
		}
	}

	//	Get no. of categories
	public int getcategoiesNo() {
		try {
			Session session = factory.openSession();
			Query<Category> query = session.createQuery("from Category", Category.class);
			int categoryNo = query.getResultList().size();
			session.close();
			return categoryNo;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
