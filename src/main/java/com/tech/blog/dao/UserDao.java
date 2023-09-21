package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		
		public User getUserByEmailAndPassword(String email , String password) {
			User u = null;
			
			String query = "select * from user where email = ? and password = ?";
			
			try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				u = new User();
				u.setName(rs.getString("name"));
				u.setId(rs.getInt("id"));
				u.setEmail(rs.getString("email"));
				u.setGender(rs.getString("gender"));
				u.setAbout(rs.getString("about"));
				u.setDateTime(rs.getTimestamp("r_date"));
				u.setProfile(rs.getString("profile"));
				}
					
					
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return u;
		}
}
