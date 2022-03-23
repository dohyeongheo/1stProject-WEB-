package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.MemberDAO;

public class IdCheckService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//���̵� �ߺ�üũ ���
		System.out.println("[1�� ������Ʈ IdCheckServiceCon]");
		
		// ���̵��ߺ�üũ ��ư�� ������ �� ajax�� ���� email �� �޾ƿ���
		String mem_id = request.getParameter("mem_id");
		System.out.println("id : " + mem_id);
		
		// ���̵� �ߺ�üũ �޼ҵ� ȣ���ϱ�
		// MemberDAO dao = new MemberDAO();
		// boolean result2 = dao.idCheck(email);
		
		boolean result = new MemberDAO().idCheck(mem_id);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
		//response.getWriter().print(result);
		//���̵� �ߺ�üũ ��������
		
		return null;
	}
}
