package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;

@WebServlet("/userMgnt.do")
public class userMgntController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public userMgntController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("userMgnt.do doGet 진입");
		RequestDispatcher rd = request.getRequestDispatcher("adminPage.jsp");
		rd.forward(request, response);
	}

	
	/**
	 * 사용자 삭제처리
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("userMgnt.do doPost 진입");
		request.setCharacterEncoding("UTF-8");

		
		UserDAO uDao = new UserDAO();
		String userId = request.getParameter("removeUserId");

		try {
			int result = uDao.removeUser(userId);
			if( result == 1) {
				request.getSession().setAttribute("userId", userId);
				request.getSession().setAttribute("removeUserYn", "Y");
			}else {
				request.getSession().setAttribute("userId", userId);
				request.getSession().setAttribute("removeUserYn", "N");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("adminPage.jsp");
		}

		response.sendRedirect("adminPage.jsp");
	}

}
