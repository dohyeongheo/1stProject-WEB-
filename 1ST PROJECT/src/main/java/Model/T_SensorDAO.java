package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class T_SensorDAO {

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

	public int t_sensorAdd(T_SensorDTO dto) {
		System.out.println("t_sensorAdd �޼ҵ� ����]");
		dbconn();
		try {
			
			for (int i = 0; i<dto.getArray_sensor_type().length; i++) {
				String sql = "Insert into t_sensor values (sensor_seq.nextval, device_seq.nextval, ? , ? , ?)";
				psmt = conn.prepareStatement(sql);
				for (int j = 0; j<dto.getArray_sensor_type().length; i++) {
					String Sensor_type = dto.getArray_sensor_type()[i];
					String Sensor_unit = dto.getArray_sensor_unit()[i];
					String Sensor_inst_date = dto.getArray_sensor_inst_date()[i];
					// console.log(Sensor_type);
					psmt.setString(1, Sensor_type);
					psmt.setString(2, Sensor_unit);
					psmt.setString(3, Sensor_inst_date);
					cnt = psmt.executeUpdate();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;

	}
}
