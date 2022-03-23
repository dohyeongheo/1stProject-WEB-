package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.WarehouseDAO;
import Model.WarehouseDTO;

public class AdminWarehouseUpdate implements Command {
	@Override

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	// 창고 정보 수정 기능
		System.out.println("[WarehouseUpdateService]");
		String nextpage = "";
	request.setCharacterEncoding("utf-8");
		
	String mem_id = request.getParameter("mem_id");
	String w_addr = request.getParameter("w_addr");
	
	System.out.println("수정할 새 아이디 : " + mem_id);
	System.out.println("수정할 새 주소 : " + w_addr);
	
	WarehouseDTO dto = new WarehouseDTO(w_addr, mem_id);
	
	WarehouseDAO dao = new WarehouseDAO();
	int cnt = dao.insert(dto);
	
	if (cnt > 0) {
		System.out.println("창고 정보 입력이 성공하였습니다.");
		
		nextpage = "index.jsp";
	} else {
		System.out.println("창고 정보 입력이 실패하였습니다.");
		nextpage = "goMain";
	}
		return nextpage;
	}

}
