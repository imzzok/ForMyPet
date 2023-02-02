package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.CartDAO;
import cart.CartDTO;


@WebServlet("/cart.do")
public class cartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public cartController() {
        super();
    }

	/**
	 * 장바구니 담기
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		
		String category = request.getParameter("category");
		if( "F".equals(category) ) {
			rd = request.getRequestDispatcher("df.jsp");
		}else {
			rd = request.getRequestDispatcher("snack.jsp");
		}
		
		rd.forward(request, response);
	}


	/**
	 * 장바구니 담기
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("장바구니 담기 POST");
		request.setCharacterEncoding("UTF-8");
		
		RequestDispatcher rd = null;
		
		String userId = (String) request.getSession().getAttribute("userId");
		CartDTO cartInfo = new CartDTO();
		
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String price = request.getParameter("price");

		cartInfo.setCode(code);
		cartInfo.setName(name);
		cartInfo.setPrice( Integer.parseInt(price) ); // String > Int 형변환
		
		CartDAO cartDAO = new CartDAO();
		try {
			int result = cartDAO.selectCart(cartInfo, userId);
			if( result > 0) {
				cartInfo.setCount(result);
				cartDAO.updateCart(cartInfo, userId);
			}else {
				cartDAO.insertCart(cartInfo, userId);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		rd = request.getRequestDispatcher("CartView.jsp");
		rd.forward(request, response);
	}
	

}
