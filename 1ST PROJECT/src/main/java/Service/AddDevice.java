package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Inter.Command;
import Model.T_DeviceDAO;
import Model.T_DeviceDTO;
import Model.T_SensorDAO;
import Model.T_SensorDTO;

public class AddDevice implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		// 센서추가 기능
		System.out.println("[AddDevice]");
		String nextpage = "";

		// 1. post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 2. 데이터 받아오기
		
		String device_uid = request.getParameter("device_uid");
		String device_loc = request.getParameter("device_loc");
		String device_inst_date = request.getParameter("device_inst_date");
		String mem_id = request.getParameter("mem_id");
		
		T_DeviceDTO dto = new T_DeviceDTO(device_uid, device_loc, device_inst_date, mem_id);
		
		T_DeviceDAO dao = new T_DeviceDAO();
		
		int cnt = dao.AddDevice(dto);
		
		PrintWriter out = response.getWriter();

		// 5. 실행결과 확인
		if (cnt > 0) {
			System.out.println("센서추가가 성공하였습니다.");
			out.print("저장 성공 \n");
			
		} else {
			System.out.println("센서추가가 실패하였습니다.");
			out.print("저장 실패 \n");
		}
		
		return null;
	}
}
