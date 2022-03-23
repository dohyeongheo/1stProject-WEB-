package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	// 전역변수 선언
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberDTO dto = null;
	int cnt = 0;

	// DB연결 메소드
	public Connection dbconn() {

		// 1. DB연결(ojdbc.6.jar 넣어주기)
		// 1-1. Class 찾기 : DB와 이클립스를 연결해주는 Class
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 1-2. DB에 접속하기 위한 주소, 아이디, 패스워드 지정
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_b_0310_5";
			String dbpw = "smhrd5";

			// 1-3. Connection 객체 사용해서 DB연결!
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	// DB연결종료 메소드
	public void dbclose() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원가입 메소드
	public int join(MemberDTO dto) {
		dbconn();
		try {
			System.out.println("[MEMBERDAO 회원가입 메소드 실행]");
			// 2. DB 실행
			// sql문 작성
			// String sql = "INSERT INTO t_member VALUES (?,?,?,?,sysdate,'u')";
			
			String sql = "Insert into t_member(mem_id, mem_pw, mem_phone, mem_name, mem_type) values (? , ? , ? , ? ,'u')";
	
			// sql문 db에 전달
			psmt = conn.prepareStatement(sql);

			// ?에 값 채우기
			psmt.setString(1, dto.getMem_id());
			psmt.setString(2, dto.getMem_pw());
			psmt.setString(3, dto.getMem_name());
			psmt.setString(4, dto.getMem_phone());
			

			// sql문 실행
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;

	}

	// 아이디 중복체크 메소드
	public boolean idCheck(String mem_id) {
		boolean result = false;
		try {
			dbconn();

			String sql = "select id from t_member where id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, mem_id);
			rs = psmt.executeQuery();

			// rs.next() : 값이 있는지 없는지 파악
			// : 값이 있으면 true (중복된 아이디 일 때)
			// : 값이 없으면 false (중복된 아이디가 없을 때)

			if (rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return result;
	}

// 로그인 메소드
	public MemberDTO login(String mem_id, String mem_pw) {

		// 로그인 = 사용자가 입력한 email pw가 있는지 없는지 확인
		System.out.println("[MEMBERDAO 로그인 메소드 실행]");
		dbconn();
		try {
			String sql = "select * from t_member where mem_id = ? and mem_pw = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);
			psmt.setString(2, mem_pw);

			rs = psmt.executeQuery();
			if (rs.next()) {
				mem_id = rs.getString(1);
				mem_pw = rs.getString(2);
				String mem_name = rs.getString(3);
				String mem_phone = rs.getString(4);
				String mem_joindate = rs.getString(5);
				String mem_type = rs.getString(6);

				// 실행결과
				// dto = new MemberDTO(mem_id, mem_pw, mem_name);
				dto = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_joindate, mem_type);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return dto;

	}

	// 회원정보 수정 메소드
	public int MemberUpdate(MemberDTO dto) {
	dbconn();
	try {
	String sql = "update t_member set mem_pw = ?, mem_name = ? , mem_phone = ? where mem_id = ? ";
	
	
	psmt = conn.prepareStatement(sql);
	
	psmt.setString(1, dto.getMem_pw());
	psmt.setString(2, dto.getMem_name());
	psmt.setString(3, dto.getMem_phone());
	psmt.setString(4, dto.getMem_id());
	
	cnt = psmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbclose();
	} return cnt;
	
	}
	
	// 아이디 비밀번호 찾기 메소드
	public MemberDTO IdPwFind(String mem_id, String mem_name, String mem_phone) {
	
	MemberDTO dto = new MemberDTO();
	System.out.println("[MEMBERDAO IdPwFind 메소드 실행]");
	
	dbconn();
	try {
		String sql = "select * from t_member where mem_id = ? and mem_name = ? and mem_phone = ?";

		psmt = conn.prepareStatement(sql);
		psmt.setString(1, mem_id);
		psmt.setString(2, mem_name);
		psmt.setString(3, mem_phone);

		
		
		rs = psmt.executeQuery();
		if (rs.next()) {
			mem_id = rs.getString(1);
			String mem_pw = rs.getString(2);
			mem_name = rs.getString(3);
			mem_phone = rs.getString(4);
			String mem_joindate = rs.getString(5);

			// 실행결과
			dto = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_joindate);
		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbclose();
	}
	return dto;

}

	// 회원정보 삭제 메소드
	
	public int MemberDelete(String mem_id) {
		
		System.out.println("[MemberDAO MemberDelete]");
		
		dbconn();
		
		System.out.println(mem_id);
		
		try {
		String sql = "delete from t_member where mem_id = ? ";	
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, mem_id);
		
		cnt = psmt.executeUpdate();
		
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}
	
}