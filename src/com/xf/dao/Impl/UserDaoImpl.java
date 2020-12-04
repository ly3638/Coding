package com.xf.dao.Impl;

import java.sql.*;

import com.xf.dao.JdbcUtil;
import com.xf.dao.UserDao;
import com.xf.entity.User;

public class UserDaoImpl implements UserDao {

	/*@Override
	 * 登陆用户
	public Boolean SelectUserByName(String userName,String password) {
	 	System.out.println("55");
		// TODO Auto-generated method stub
		boolean boo=false;
		int flag=1;
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		User user =null;
		try {
			conn = JdbcUtil.getConn();
		    String sql = "select * from users where username = ? and password = ?";
		    ps = conn.prepareStatement(sql);
		    ps.setString(1, userName);
		    ps.setString(2, password);
		    rs = ps.executeQuery();
		    System.out.println("99");
		    
		    while(rs.next()) {
		    	user=new User();
		    	user.setUsername(rs.getString(1));
		    	user.setPassword(rs.getString(2));
		    	boo=true;
		    	//System.out.println("0");
		    }
		    
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(user);
		return boo;
	}*/

	/*@Override
	public int InsertUser(User user) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		int row = 0;
		try {
			conn=JdbcUtil.getConn();
			String sql="insert into users (username,password,email) values (?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setObject(1, user.userName);
			ps.setObject(2, user.password);
			ps.setObject(3, user.email);
			row = ps.executeUpdate();
			if(row > 0) {
				System.out.println("成功插入");
			}else {
				System.out.println("失败插入");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}*/

	@Override
	public int SelectUserByUserName(String userName) {
		// TODO Auto-generated method stub
		boolean boo=false;
		int flag=0;
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		User user =null;
		try {
			conn = JdbcUtil.getConn();
		    String sql = "select * from users where userName = ?";
		    ps = conn.prepareStatement(sql);
		    ps.setString(1, userName);
		   // ps.setString(2, password);
		    rs = ps.executeQuery();
//		    System.out.println("99");
		    while(rs.next()) {
		    	user=new User();
		    	user.setUserName(rs.getString(1));
//		    	user.setPassword(rs.getString(2));
		    	flag =1 ;
		    	//System.out.println("0");
		    }
		    
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(user);
		return flag;
	}

	@Override
	public int InsertUser(String userName, String password, String email) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		int row = 0;
		try {
			conn=JdbcUtil.getConn();
			String sql="insert into users (userName,password,email) values (?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setObject(1, userName);
			ps.setObject(2, password);
			ps.setObject(3, email);
			System.out.println("成功插入");
			row = ps.executeUpdate();
			if(row > 0) {
				System.out.println("成功插入");
			}else {
				System.out.println("失败插入");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

	@Override
	public User SelectUserByName(String userName, String password) {
		// TODO Auto-generated method stub
		Connection  conn =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user =null;
		try {
			conn =JdbcUtil.getConn();
			String sql = "select * from users where userName = ? and password = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);
			rs = ps.executeQuery();
			System.out.println(77);
			while(rs.next()) {
				user =new User();
				user.setUserName(rs.getString(1));
				user.setPassword(rs.getString(2));
			}
//			System.out.println(77);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	}