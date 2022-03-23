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
		
	// â�� ���� ���� ���
		System.out.println("[WarehouseUpdateService]");
		String nextpage = "";
	request.setCharacterEncoding("utf-8");
		
	String mem_id = request.getParameter("mem_id");
	String w_addr = request.getParameter("w_addr");
	
	System.out.println("������ �� ���̵� : " + mem_id);
	System.out.println("������ �� �ּ� : " + w_addr);
	
	WarehouseDTO dto = new WarehouseDTO(w_addr, mem_id);
	
	WarehouseDAO dao = new WarehouseDAO();
	int cnt = dao.insert(dto);
	
	if (cnt > 0) {
		System.out.println("â�� ���� �Է��� �����Ͽ����ϴ�.");
		
		nextpage = "index.jsp";
	} else {
		System.out.println("â�� ���� �Է��� �����Ͽ����ϴ�.");
		nextpage = "goMain";
	}
		return nextpage;
	}

}
