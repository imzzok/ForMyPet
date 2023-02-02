package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JDBC.JdbcUtil;

public class UserDAO {
	
	// Connection 데이터 베이스 접근하게 해주는 하나의 객체
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private final String USER_INSERT = "INSERT INTO USER VALUES(?, ?, ?, ?, ?, ?)";
	private final String USER_SELECT = "SELECT userPassword, auth FROM USER WHERE userId= ?";
	private final String USER_INFO_LIST_SELECT = "SELECT userId, userName, userGender, userEmail FROM USER WHERE auth= 'normal' ORDER BY userID ASC";
	private final String REMOVE_USER = "DELETE FROM USER WHERE userId = ?";

	/**
	 * 로그인 - Selet 함수
	 * @param userInfo
	 * @return
	 */
	public int login(UserDTO userInfo) throws SQLException { // 아이디와 비밀번호를 받아옴
		
		try {
			
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(USER_SELECT);
			pstmt.setString(1, userInfo.getUserId());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if ( rs.getString(1).equals(userInfo.getUserPassword()) ) {
					if( rs.getString(2).equals("normal") ) {
						return 1; // 일반회원 로그인 성공
					}else {
						return 2; // 관리자 로그인 성공
					}
				}else
					return 0; // 비밀번호 불일치
			}
			
			return -1; // 아이디가 없음
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류를 의미합니다.
	}

	
	/**
	 * 회원가입 Insert 함수
	 * @param unserInfo
	 * @return
	 * @throws SQLException
	 */
	public int insertMember(UserDTO unserInfo) throws SQLException {
		
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(USER_INSERT);
			pstmt.setString(1, unserInfo.getUserId());
			pstmt.setString(2, unserInfo.getUserPassword());
			pstmt.setString(3, unserInfo.getUserName());
			pstmt.setString(4, unserInfo.getUserGender());
			pstmt.setString(5, unserInfo.getUserEmail());
			pstmt.setString(6, "normal");
			pstmt.executeUpdate();

			return 1;
			
		} catch (Exception e) {
			return -2;
		
		} finally {
			JdbcUtil.close(pstmt, conn);
		}
	}
	
	
	/**
	 * 사용자정보 항목 조회
	 * @param userInfo
	 * @return
	 */
	public ArrayList<UserDTO> userInfoList() throws SQLException {
		
		ArrayList<UserDTO> userInfoList = new ArrayList<UserDTO>();
		
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(USER_INFO_LIST_SELECT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				UserDTO userInfo = new UserDTO();
				userInfo.setUserId(rs.getString(1));
				userInfo.setUserName(rs.getString(2));
				userInfo.setUserGender(rs.getString(3));
				userInfo.setUserEmail(rs.getString(4));
				userInfoList.add(userInfo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userInfoList;
	}
	
	
	/**
	 * 사용자 삭제
	 * @param userInfo
	 * @return
	 */
	public int removeUser(String userId) throws SQLException {
		
		System.out.println("UserDAO 진입 removeUser :: " + userId);
		int result = 0;
		
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(REMOVE_USER);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
			System.out.println("삭제 결과 :: " + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}