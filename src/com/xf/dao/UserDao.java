package com.xf.dao;

import com.xf.entity.User;

public interface UserDao {
//	登陆页面
	public User SelectUserByName(String userName,String password);
	//public User SelectUserByName(User user);
//	注册用户
    public int InsertUser(String userName,String password,String email);
//    验证用户
    public int SelectUserByUserName(String username);
}
