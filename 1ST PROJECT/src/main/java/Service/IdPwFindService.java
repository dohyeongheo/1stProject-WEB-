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
		
		// 회원가입 기능
		System.out.println("[IdPwFindService]");
		String nextpage = "";

		// 1. post방식 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 데이터 받아오기
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
			System.out.println("비밀번호 조회 성공");
			System.out.println("아이디 : " + dto.getMem_id());
			System.out.println("이름 : " + dto.getMem_name());
			System.out.println("비밀번호 : " + dto.getMem_pw());
			
			session.setAttribute("PwFind", dto.getMem_pw());
			
			nextpage = "IdPwFind.jsp";
			
		} else {
			System.out.println("비밀번호 조회 실패");
			nextpage = "goMain";
			
		}
		
		return nextpage;
		
	}
	
	
}
