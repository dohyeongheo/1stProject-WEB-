package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

	// �������� ����
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberDTO dto = null;
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
	public int join(MemberDTO dto) {
		try {
			System.out.println("[MEMBERDAO ȸ������ �޼ҵ� ����]");
			dbconn();
			// 2. DB ����
			// sql�� �ۼ�
			String sql = "INSERT INTO t_member VALUES (?,?,?,?,sysdate,'u')";
			

			// sql�� db�� ����
			psmt = conn.prepareStatement(sql);

			// ?�� �� ä���
			psmt.setString(1, dto.getMem_id());
			psmt.setString(2, dto.getMem_pw());
			psmt.setString(3, dto.getMem_name());
			psmt.setString(4, dto.getMem_phone());
			// psmt.setString(6, dto.getMem_type());

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
	public boolean idCheck(String email) {
		boolean result = false;
		try {
			dbconn();

			String sql = "select email from web_member2 where email = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, email);
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
	public MemberDTO login(String mem_id, String mem_pw) {

		// �α��� = ����ڰ� �Է��� email pw�� �ִ��� ������ Ȯ��
		System.out.println("[MEMBERDAO �α��� �޼ҵ� ����]");
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
				String mem_name =rs.getString(3); 

				// ������
				dto = new MemberDTO(mem_id, mem_pw, mem_name);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return dto;

	}


}