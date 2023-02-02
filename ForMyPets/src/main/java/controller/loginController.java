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
import user.UserDTO;

@WebServlet("/login.do")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public loginController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("login.do doGet 진입");
		request.getSession().invalidate();
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	/**
	 * 로그인 처리
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("login.do doPost 진입");

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("userId");
		String pw = request.getParameter("userPassword");

		UserDTO uDto = new UserDTO();
		uDto.setUserId(id);
		uDto.setUserPassword(pw);

		UserDAO uDao = new UserDAO();
		try {
			int result = uDao.login(uDto);

			if (result > 0) {
				request.getSession().setAttribute("userId", id);
				request.getSession().setAttribute("loginYn", "Y");

				if (result == 1) {
					System.out.println("일반회원");
					request.getSession().setAttribute("adminYn", "N");
					response.sendRedirect("index.jsp");
				}else if (result == 2) {
					System.out.println("괸리자");
					request.getSession().setAttribute("adminYn", "Y");
					response.sendRedirect("adminPage.jsp");
				}
			} else {
				request.getSession().setAttribute("loginYn", "N");
				response.sendRedirect("login.jsp");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp");
		}
	}

}
