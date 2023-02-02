package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JDBC.JdbcUtil;
import user.UserDTO;

public class CartDAO {
	
	// Connection 데이터 베이스 접근하게 해주는 하나의 객체
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String CART_CHECK = "SELECT COUNT(*) FROM CART WHERE 1=1 AND USERID = ? AND CODE = ?";
	private String INSERT_CART = "INSERT INTO CART VALUES(?, ?, ?, ?, ?)";
	private String UPDATE_CART = "UPDATE CART SET COUNT = ? WHERE 1=1 AND USERID = ? AND CODE = ?";
	private String SELECT_CART_LIST = "SELECT CODE, NAME, PRICE, COUNT FROM CART WHERE 1=1 AND USERID = ?";

	/**
	 * 이미 등록된 상품인지 조회
	 * @param cart
	 * @return
	 * @throws SQLException
	 */
	public int selectCart(CartDTO cartDto, String userId) throws SQLException {
		
		int resultCnt = 0;
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(CART_CHECK);
			pstmt.setString(1, userId);
			pstmt.setString(2, cartDto.getCode());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				resultCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt, conn);
		}
		
		return resultCnt;
	}
	
	/**
	 * 장바구니 리스트 가져오기
	 * @param cart
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<CartDTO> selectCartList(String userId) throws SQLException {
		
		ArrayList<CartDTO> cartList = new ArrayList<CartDTO>();
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(SELECT_CART_LIST);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				CartDTO cartInfo = new CartDTO();
				cartInfo.setCode(rs.getString(1));
				cartInfo.setName(rs.getString(2));
				cartInfo.setPrice(rs.getInt(3));
				cartInfo.setCount(rs.getInt(4));
				cartList.add(cartInfo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt, conn);
		}
		return cartList;
	}
	
	
	/**
	 * 상품 정보 생성
	 * @param cart
	 * @return
	 * @throws SQLException
	 */
	public int insertCart(CartDTO cartDto, String userId) throws SQLException {
		System.out.println("Insert DAO");
		int insertCount = 0;
		
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(INSERT_CART);
			pstmt.setString(1, userId);
			pstmt.setString(2, cartDto.getCode());
			pstmt.setString(3, cartDto.getName());
			pstmt.setInt(4, cartDto.getPrice());
			pstmt.setInt(5, 1);
			
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt, conn);
		}
		
		return insertCount;
	}
	
	
	/**
	 * 상품 정보 수정
	 * @param cart
	 * @return
	 * @throws SQLException
	 */
	public int updateCart(CartDTO cartDto, String userId) throws SQLException {
		System.out.println("updateCart");
		int insertCount = 0;
		
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(UPDATE_CART);
			pstmt.setInt(1, (cartDto.getCount()+1));
			pstmt.setString(2, userId);
			pstmt.setString(3, cartDto.getCode());
			pstmt.executeUpdate();
			
			insertCount = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt, conn);
		}
		
		return insertCount;
	}
}