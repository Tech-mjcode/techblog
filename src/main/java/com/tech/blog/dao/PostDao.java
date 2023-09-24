package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	private Connection con;
	public PostDao(Connection c) {
		this.con = c;
	}

	public PostDao() {
		
	}
	
	public boolean savePost(Post post) {
		boolean f = false;
		
		try {
			String query = "insert into post(p_title,p_content,p_pic,p_code,c_id,u_id) values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, post.getpTitle());
			ps.setString(2, post.getpContent());
			ps.setString(3, post.getpPic());
			ps.setString(4, post.getpCode());
			ps.setInt(5,post.getcId());
			ps.setInt(6,post.getuId());
			ps.executeUpdate();
			f = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public ArrayList<Category> getAllCategories() {
			ArrayList<Category>  cList = new ArrayList<Category>();
			
			String query = "select * from category";
			try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(query);
			while(rs.next()) {
				Category c = new Category(rs.getInt("c_id"), rs.getString("c_name"), rs.getString("c_description"));
				cList.add(c);
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return cList;
	}
}
