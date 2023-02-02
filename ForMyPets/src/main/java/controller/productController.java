package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;
import product.ProductDTO;


@WebServlet("/product.do")
public class productController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public productController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		
		String category = request.getParameter("category");
		if( "F".equals(category) ) {
			rd = request.getRequestDispatcher("df.jsp");
		}else {
			rd = request.getRequestDispatcher("snack.jsp");
		}
		
		ArrayList<ProductDTO> pInfoList = getProductInfo(category, "ALL");
		request.getSession().setAttribute("pInfoList", pInfoList);
		rd.forward(request, response);
	}


	/**
	 * 사료 및 간식 정보를 가져오기 위한 함수
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("product.do doPost 진입");
		request.setCharacterEncoding("UTF-8");
		
		RequestDispatcher rd = null;
		
		String category = request.getParameter("category");
		if( "F".equals(category) ) {
			rd = request.getRequestDispatcher("df.jsp");
		}else {
			rd = request.getRequestDispatcher("snack.jsp");
		}
		
		String property = request.getParameter("property");
		ArrayList<ProductDTO> pInfoList = getProductInfo(category, property);
		request.getSession().setAttribute("pInfoList", pInfoList);
		request.getSession().setAttribute("property", property);
		rd.forward(request, response);
	}
	
	
	/**
	 * 상품정보 조회
	 * @param property
	 * @return
	 * @throws IOException
	 */
	public ArrayList<ProductDTO> getProductInfo(String category, String property) throws  IOException {
		
		ArrayList<ProductDTO> pInfoList = new ArrayList<ProductDTO>();
		ProductDAO pDao = new ProductDAO();
		
		try {
			pInfoList = pDao.pInfoList(category, property);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pInfoList;
	}

}
