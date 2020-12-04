package com.xf.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;import org.apache.tomcat.jni.User;

import com.xf.biz.UserBiz;
import com.xf.bizImpl.UserBizImpl;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		User user =new User();
		/*int row=0;
		Boolean bo =false;
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmPassword");
		String email = request.getParameter("email");
		UserBiz ub =new UserBizImpl();
		if(confirmpassword==password) {
			 ub.InsertUser(username, password, email);
			 request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			System.out.println("两次密码不正确");*/
		}
		/*UserBiz ub =new UserBizImpl();
		row = ub.InsertUser(username, password, email);*/
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int row=0;
		Boolean bo =false;
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmPassword");
		String email = request.getParameter("email");
		UserBiz ub =new UserBizImpl();
		if(confirmpassword.equals(password)) {
			 ub.InsertUser(username, password, email);
			 request.getRequestDispatcher("register_succes.jsp").forward(request, response);
		}else {
			System.out.println("两次密码不正确");
		}
		doGet(request, response);
	}

}
