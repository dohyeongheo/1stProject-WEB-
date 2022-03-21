package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;
import Model.MemberDTO;
import Inter.Command;

public class JoinService implements Command {

	// 1. Command �������̽� ����

	// 2. �������̽��� �ִ� execute() �޼ҵ� �������̵�
	// �ڵ��ϼ� -> ����

	// 3. ������ �̵� response ... ����
	// String nextpage = "�̵��� �ּ�"

	// 4. �޼ҵ� return ������ nextpage

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ȸ������ ���

		System.out.println("[JoinServiceCon]");

		// 1. post��� ���ڵ�
		request.setCharacterEncoding("UTF-8");

		// 2. ������ �޾ƿ���
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		String mem_type = request.getParameter("mem_type");

		System.out.println("id : " + mem_id);
		System.out.println("pw : " + mem_pw);
		System.out.println("name : " + mem_name);
		System.out.println("tel : " + mem_phone);
		System.out.println("type : " + mem_type);

		// 3. ������ DTO�� ����
		// MemberDTO dto = new MemberDTO()
		MemberDTO dto = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_type);

		// 4. DB ������ DAO ȣ��
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(dto);

		// ���� ����
		// HttpSession Session = request.getSession();

		String nextpage = "";

		// 5. ������ Ȯ��
		if (cnt > 0) {
			System.out.println("ȸ�������� �����Ͽ����ϴ�.");

			// email session���� �����!
			// Session.setAttribute("email", email);
			// response.sendRedirect("join_success.jsp");
			// nextpage = "join_success.jsp";

		} else {
			System.out.println("ȸ�������� �����Ͽ����ϴ�.");
			// response.sendRedirect("goMain");
			// nextpage = "goMain";
		}

		return nextpage;
		// ȸ������ ��� ������ ��

	}
}
