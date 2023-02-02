package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout.do")
public class logoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public logoutController() {
		super();

	}

	
	/**
	 * 로그아웃 처리 GET
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("logout.do doGet 진입");

		request.getSession().invalidate();
		request.getSession().setAttribute("logout", "Y");
		response.sendRedirect("index.jsp");
	}

	/**
	 * 로그아웃 처리 POST
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("logout.do doPost 진입");

		request.getSession().invalidate();
		request.getSession().setAttribute("logout", "Y");
		response.sendRedirect("index.jsp");
	}

}
