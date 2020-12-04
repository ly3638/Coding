package com.xf.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xf.biz.UserBiz;
import com.xf.bizImpl.UserBizImpl;

/**
 * Servlet implementation class IsExeitUserServlet
 */
@WebServlet("/isexistsuser")
public class IsExeitUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IsExeitUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean bo=false;
		int num=0;
		String username = request.getParameter("userName");
		UserBiz ub = new UserBizImpl();
		System.out.println(username);
		num = ub.SelectUserByUserName(username);
		if(num >0) {
			bo =true;
		}
		PrintWriter out =response.getWriter();
		System.out.println(bo);
		if(bo == true) {
			out.write("true");
		}else {
			out.write("false");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
