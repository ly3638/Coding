package com.xf.bizImpl;

import com.xf.biz.UserBiz;
import com.xf.dao.UserDao;
import com.xf.dao.Impl.UserDaoImpl;
import com.xf.entity.User;

public class UserBizImpl implements UserBiz {
	UserDao userDao=new UserDaoImpl();
	/*@Override
	public Boolean SelectUserByName(String userName, String password) {
		// TODO Auto-generated method stub
		return userDao.SelectUserByName(userName, password);
	}*/
	@Override
	public int SelectUserByUserName(String userName) {
		// TODO Auto-generated method stub
		return userDao.SelectUserByUserName(userName);
	}
	@Override
	public int InsertUser(String userName, String password, String email) {
		// TODO Auto-generated method stub
		return userDao.InsertUser(userName, password, email);
	}
	@Override
	public User SelectUserByName(String userName, String password) {
		// TODO Auto-generated method stub
		return userDao.SelectUserByName(userName, password);
	}
	
	

}
