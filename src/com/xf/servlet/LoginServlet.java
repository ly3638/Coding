package com.xf.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xf.biz.UserBiz;
import com.xf.bizImpl.UserBizImpl;
import com.xf.entity.User;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserBiz ub =new UserBizImpl();
       
  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub

	String username = request.getParameter("userName");
	String password = request.getParameter("password");
	System.out.println(username);
	System.out.println(password);
	//UserBiz ub =new UserBizImpl();
//	boolean bo = ub.SelectUserByName(username,password);
	User loginUser = ub.SelectUserByName(username, password);
	System.out.println("查的是："+loginUser);
	PrintWriter out =response.getWriter();
	response.setContentType("application/json; charset=UTF-8");
	
	if(loginUser != null) {
//		out.write("1");
		System.out.println(loginUser);
		if(password.equals(loginUser.getPassword())) {//密码正确
//			得到一个会话对象        
			HttpSession session = request.getSession();
//			给对象添加属性
		session.setAttribute("loginUser", loginUser);
		out.write("1");
		}
		else {
			out.write("0");
		}
	//request.getRequestDispatcher("main.jsp").forward(request, response);
	}else {//用户名错误
		response.getWriter().write("-1");
//		request.setAttribute("msg", "登陆失败");
		//不能重定向了，重定向的话就不能把-1传到前端
		//response.sendRedirect("login.jsp");
	} 
	out.close();
  
}

}
