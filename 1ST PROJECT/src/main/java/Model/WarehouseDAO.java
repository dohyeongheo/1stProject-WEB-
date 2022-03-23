package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class WarehouseDAO {

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

	public int insert(WarehouseDTO dto) {
		dbconn();
		try {
			System.out.println("[WarehouseDAO insert �޼ҵ� ����]");
			
			String sql = "INSERT INTO t_warehouse(w_addr, w_latitude, w_longitude, mem_id) VALUES (?,1,1,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getW_addr());
			psmt.setString(2, dto.getMem_id());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;

	}
}