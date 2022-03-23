package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Inter.Command;
import Model.MemberDAO;
import Model.MemberDTO;

public class IdPwFindService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// ȸ������ ���
		System.out.println("[IdPwFindService]");
		String nextpage = "";

		// 1. post��� ���ڵ�
		request.setCharacterEncoding("UTF-8");

		// 2. ������ �޾ƿ���
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");

		System.out.println("id : " + mem_id);
		System.out.println("name : " + mem_name);
		System.out.println("phone : " + mem_phone);
		
		// MemberDTO dto = new MemberDTO(mem_id, mem_name, mem_phone);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.IdPwFind(mem_id, mem_name, mem_phone);
		
		HttpSession session = request.getSession();
		
		if (dto != null) {
			System.out.println("��й�ȣ ��ȸ ����");
			System.out.println("���̵� : " + dto.getMem_id());
			System.out.println("�̸� : " + dto.getMem_name());
			System.out.println("��й�ȣ : " + dto.getMem_pw());
			
			session.setAttribute("PwFind", dto.getMem_pw());
			
			nextpage = "IdPwFind.jsp";
			
		} else {
			System.out.println("��й�ȣ ��ȸ ����");
			nextpage = "goMain";
			
		}
		
		return nextpage;
		
	}
	
	
}
