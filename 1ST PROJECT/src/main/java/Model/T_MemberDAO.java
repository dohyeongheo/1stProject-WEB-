package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class T_MemberDAO {

	// �������� ����
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	T_MemberDTO dto = null;
	int cnt = 0;

	// DB���� �޼ҵ�
	public Connection dbconn() {

		// 1. DB����(ojdbc.6.jar �־��ֱ�)
		// 1-1. Class ã�� : DB�� ��Ŭ������ �������ִ� Class
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 1-2. DB�� �����ϱ� ���� �ּ�, ���̵�, �н����� ����
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_b_0310_5";
			String dbpw = "smhrd5";

			// 1-3. Connection ��ü ����ؼ� DB����!
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	// DB�������� �޼ҵ�
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

	// ȸ������ �޼ҵ�
	public int join(T_MemberDTO dto) {
		dbconn();
		try {
			System.out.println("[MEMBERDAO ȸ������ �޼ҵ� ����]");
			// 2. DB ����
			// sql�� �ۼ�
			// String sql = "INSERT INTO t_member VALUES (?,?,?,?,sysdate,'u')";
			
			String sql = "Insert into t_member(mem_id, mem_pw, mem_phone, mem_name, mem_type) values (? , ? , ? , ? ,'u')";
	
			// sql�� db�� ����
			psmt = conn.prepareStatement(sql);

			// ?�� �� ä���
			psmt.setString(1, dto.getMem_id());
			psmt.setString(2, dto.getMem_pw());
			psmt.setString(3, dto.getMem_name());
			psmt.setString(4, dto.getMem_phone());
			

			// sql�� ����
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;

	}

	// ���̵� �ߺ�üũ �޼ҵ�
	public boolean idCheck(String mem_id) {
		boolean result = false;
		try {
			dbconn();

			String sql = "select id from t_member where id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, mem_id);
			rs = psmt.executeQuery();

			// rs.next() : ���� �ִ��� ������ �ľ�
			// : ���� ������ true (�ߺ��� ���̵� �� ��)
			// : ���� ������ false (�ߺ��� ���̵� ���� ��)

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

// �α��� �޼ҵ�
	public T_MemberDTO login(String mem_id, String mem_pw) {

		// �α��� = ����ڰ� �Է��� email pw�� �ִ��� ������ Ȯ��
		System.out.println("[MEMBERDAO �α��� �޼ҵ� ����]");
		System.out.println(mem_id);
		System.out.println(mem_pw);
		
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

				// ������
				// dto = new MemberDTO(mem_id, mem_pw, mem_name);
				dto = new T_MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_joindate, mem_type);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return dto;

	}

	// ȸ������ ���� �޼ҵ�
	public int MemberUpdate(T_MemberDTO dto) {
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
	
	// ���̵� ã�� �޼ҵ�
	public String FindId(String mem_name, String mem_phone) {
	
		System.out.println("[MEMBERDAO FindId �޼ҵ� ����]");
		
		String mem_id = "";
	
	dbconn();
	try {
		String sql = "select * from t_member where mem_name = ? and mem_phone = ?";

		psmt = conn.prepareStatement(sql);
		psmt.setString(1, mem_name);
		psmt.setString(2, mem_phone);

		
		
		rs = psmt.executeQuery();
		if (rs.next()) {
			mem_id = rs.getString(1);

			// ������

		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbclose();
	}
	return mem_id;

}
	
	// ��й�ȣ ã�� �޼ҵ�
	public String FindPw(String mem_id, String mem_name, String mem_phone) {
	
		System.out.println("[MEMBERDAO FindId �޼ҵ� ����]");
		
		String mem_pw = "";
	
	dbconn();
	try {
		String sql = "select * from t_member where mem_id = ? and mem_name = ? and mem_phone = ?";

		psmt = conn.prepareStatement(sql);
		psmt.setString(1, mem_id);
		psmt.setString(2, mem_name);
		psmt.setString(3, mem_phone);

		
		
		rs = psmt.executeQuery();
		if (rs.next()) {
			mem_pw = rs.getString(2);

			// ������

		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbclose();
	}
	return mem_pw;

}

	// ȸ������ ���� �޼ҵ�
	
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