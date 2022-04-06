package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_SensorDAO;
import Model.T_Sensor_valueDAO;
import Model.T_Standard_valuseDAO;
import Model.T_WarehouseDAO;

public class DeleteSensor implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[DeleteSensor.java]");

		// 센서 삭제 기능(해당 센서와 관련 된 값 삭제)
		// 센서 관련된 table
		// 1. t_sensor 2. t_sensor_value 3.t_standrdvaluse

		String sen_seq = request.getParameter("sensor_seq");
		String sensor_type = request.getParameter("sensor_type");

		System.out.println("sen_seq : " + sen_seq + "\nsensor_type : " + sensor_type);
		if (sen_seq != null && sensor_type != null) {
			// 1. t_sensor 삭제
			T_SensorDAO sensordao = new T_SensorDAO();
			int sensorcnt = sensordao.deleteSensor(sen_seq, sensor_type);
			if (sensorcnt > 0) {
				System.out.println("t_sensor : " + sen_seq + "/" + sensor_type + "삭제 성공");
			} else {
				System.out.println("t_sensor 센서정보 삭제 실패");
			}
			// 2. t_sensor_value
			T_Sensor_valueDAO svdao = new T_Sensor_valueDAO();
			int SVcnt = svdao.deleteSensor(sen_seq);
			if (SVcnt > 0) {
				System.out.println("t_sensor_value : " + sen_seq + "삭제 성공");
			} else {
				System.out.println("t_sensor_value 센서정보 삭제 실패");
			}
			// 3. t_standardvaluse
			T_Standard_valuseDAO stvdao = new T_Standard_valuseDAO();
			String wh_seq = svdao.getWhNum(sen_seq);
			int stvcnt = stvdao.deleteSensor(sen_seq, wh_seq);
			if (stvcnt > 0) {
				System.out.println("T_Standard_valuse : " + sen_seq + "/" + sensor_type + "삭제 성공");
			} else {
				System.out.println("T_Standard_valuse 센서정보 삭제 실패");
			}
		}

		String nextpage = "AdminSensorSelect.jsp";

		return nextpage;
	}

}
