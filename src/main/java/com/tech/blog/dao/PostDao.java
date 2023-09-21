package com.tech.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;

import com.tech.blog.entities.Category;

public class PostDao {
	private Connection con;
	public PostDao(Connection c) {
		this.con = c;
	}

	public PostDao() {
		
	}
	
	public ArrayList<Category> getAllCategories() {
			
			ArrayList<Category>  cList = new ArrayList<Category>();
			return cList;
	}
}
