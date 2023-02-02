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


@WebServlet("/join.do")
public class joinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public joinController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("join.do doPost 진입");
		request.setCharacterEncoding("UTF-8");
		
		//RequestDispatcher dispatcher = null;
		
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPassword");
		String name = request.getParameter("userName");
		String gender = request.getParameter("userGender");
		String email = request.getParameter("userEmail");

		UserDTO uDto = new UserDTO();
		uDto.setUserId(id);
		uDto.setUserPassword(pw);
		uDto.setUserName(name);
		uDto.setUserGender(gender);
		uDto.setUserEmail(email);

		UserDAO uDao = new UserDAO();
		
		try {
			uDao.insertMember(uDto);
		
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("join.jsp");
		}
		
		//dispatcher = request.getRequestDispatcher("index.jsp");
		response.sendRedirect("index.jsp");
		//dispatcher.forward(request, response);
		

	}

}
