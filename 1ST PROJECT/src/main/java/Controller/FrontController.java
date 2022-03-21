package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Inter.Command;
import Service.JoinService;
import Service.LoginService;

//.do로 끝나는 문자열 맵핑값을 다 포함시킴
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//FrontController Pattern
		//1. 모든 요청을 하나의 servlet으로 정의하는 패턴
		//2. 중복되는 코드를 줄일수 있고, 보안을 적용할때 하나의 serlvet에서 적용할수 있다.
		
		System.out.println("[1차 프로젝트 frontController 실행]");
		String nextpage = "";
		Command com = null;
		
		//어떤 기능을 수행하는 문자열인지 판단
		String uri = request.getRequestURI();
		System.out.println(uri);
		
		String path = request.getContextPath();
		System.out.println(path);
		
		String command = uri.substring(path.length()+1);
		System.out.println(command);
			
		
		if(command.equals("LoginServiceCon.do")) {
			//여러객체를 불러올 필요 없이
			//부모 클래스가 가지고 있는 메소드를
			//하위 클래스가 재정의(오버라이딩)
			System.out.println("[로그인서비스실행]");
			com = new LoginService();
			nextpage = com.execute(request, response);
		}

		else if(command.equals("JoinServiceCon.do")) {
//			1. com객체에 JoinService(); 객체 담아주기
//			2. com에 있는 execute() 메소드 호출해서
//			3. 리턴값 nextpage로 담아주기
			System.out.println("[회원가입서비스실행]");
			com = new JoinService();
			nextpage = com.execute(request, response);
			
			
//		}else if(command.equals("MsgCon.do")) {
//			
//			com = new MsgService();
//			nextpage = com.execute(request, response);
//			
//			
//		}else if(command.equals("LogoutServiceCon.do")) {
//			com = new LogoutService();
//			 nextpage  = com.execute(request, response);
//			
//		}else if(command.equals("IdCheckServiceCon.do")) {
//			com = new IdCheckService();
//			nextpage = com.execute(request, response);
//			
//			
//		}else if(command.equals("UpdateServiceCon.do")) {
//			com = new UpdateService();
//			nextpage = com.execute(request, response);
//			
//		}else if(command.equals("DeleteServiceCon.do")) {
//			com = new DeleteService();
//			nextpage = com.execute(request, response);
//			
//		}else if(command.equals("WriteBoardService.do")) {
//			System.out.println(" 여기 ");
//			com = new WriteBoardService();
//			nextpage = com.execute(request, response);
//		}
		//else if 마지막줄
		
		if(nextpage != null) {
		response.sendRedirect(nextpage);
		}
		
	}//service메소드

}
}
