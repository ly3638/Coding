package com.xf.dao;

import com.xf.entity.User;

public interface UserDao {
//	��½ҳ��
	public User SelectUserByName(String userName,String password);
	//public User SelectUserByName(User user);
//	ע���û�
    public int InsertUser(String userName,String password,String email);
//    ��֤�û�
    public int SelectUserByUserName(String username);
}
