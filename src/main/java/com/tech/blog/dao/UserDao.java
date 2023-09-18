package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.tech.blog.entities.User;

public class UserDao {
		private Connection con;
		
		public UserDao(Connection con){
			this.con =  con;
		}
		
		public boolean saveUser(User user) {
			boolean f = false;
			try {
				String sql = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
				PreparedStatement p = con.prepareStatement(sql);
				p.setString(1, user.getName());
				p.setString(2, user.getEmail());
				p.setString(4, user.getGender());
				p.setString(3, user.getPassword());
				p.setString(5, user.getAbout());
				p.executeUpdate();
				f = true;
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			return f;
		}
}
