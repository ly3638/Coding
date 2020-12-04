package com.xf.biz;

import com.xf.entity.User;

public interface UserBiz {
	public User SelectUserByName(String userName,String password);
	public int InsertUser(String userName,String password,String email);
	public int SelectUserByUserName(String userName);
}
