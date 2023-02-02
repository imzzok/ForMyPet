package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JDBC.JdbcUtil;

public class ProductDAO {
	
	// Connection 데이터 베이스 접근하게 해주는 하나의 객체
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String PRODUCT_SELECT = "SELECT CODE, NAME, INFO, PRICE, PROPERTY, IMGPATH, CATEGORY FROM PRODUCT WHERE 1=1 ";
	
	
	/**
	 * 상품정보 조회
	 * @param category F-푸드, S-간식 / property - 영양성분
	 * @return
	 */
	public ArrayList<ProductDTO> pInfoList(String category, String property) throws SQLException {
		
		ArrayList<ProductDTO> pInfoList = new ArrayList<ProductDTO>();
		
		try {
			
			conn = JdbcUtil.getConnection();
			PRODUCT_SELECT = PRODUCT_SELECT + "AND CATEGORY = ?";
			
			if(!"ALL".equals(property)) {
				PRODUCT_SELECT = PRODUCT_SELECT + " AND PROPERTY LIKE '%" + property + "%'";
			}

			PreparedStatement pstmt = conn.prepareStatement(PRODUCT_SELECT);
			pstmt.setString(1, category); // 사료인지, 간식인지 구분
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				ProductDTO pInfo = new ProductDTO();
				pInfo.setCode(rs.getString(1));
				pInfo.setName(rs.getString(2));
				pInfo.setInfo(rs.getString(3));
				pInfo.setPrice(rs.getInt(4));
				pInfo.setProperty(rs.getString(5));
				pInfo.setImgPath(rs.getString(6));
				pInfo.setCategory(rs.getString(7));
				pInfoList.add(pInfo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pInfoList;
	}
	
}