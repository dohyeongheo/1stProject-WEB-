package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_MemberDAO;
import Model.T_WarehouseDAO;

public class deleteWarehouse implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[deleteWarehouse Service]");
		
		// 회원정보 삭제 기능

		String mem_id = request.getParameter("mem_id");

		T_WarehouseDAO dao = new T_WarehouseDAO();
		int cnt = dao.DeleteWarehouse(mem_id);

		if (cnt > 0) {
			System.out.println("창고정보 삭제 성공");
		} else {
			System.out.println("창고정보 삭제 실패");
		}

		String nextpage = "AdminWarehouseSelect.jsp.jsp";

		return nextpage;
	}

}
