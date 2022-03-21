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

//.do�� ������ ���ڿ� ���ΰ��� �� ���Խ�Ŵ
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//FrontController Pattern
		//1. ��� ��û�� �ϳ��� servlet���� �����ϴ� ����
		//2. �ߺ��Ǵ� �ڵ带 ���ϼ� �ְ�, ������ �����Ҷ� �ϳ��� serlvet���� �����Ҽ� �ִ�.
		
		System.out.println("[1�� ������Ʈ frontController ����]");
		String nextpage = "";
		Command com = null;
		
		//� ����� �����ϴ� ���ڿ����� �Ǵ�
		String uri = request.getRequestURI();
		System.out.println(uri);
		
		String path = request.getContextPath();
		System.out.println(path);
		
		String command = uri.substring(path.length()+1);
		System.out.println(command);
			
		
		if(command.equals("LoginServiceCon.do")) {
			//������ü�� �ҷ��� �ʿ� ����
			//�θ� Ŭ������ ������ �ִ� �޼ҵ带
			//���� Ŭ������ ������(�������̵�)
			System.out.println("[�α��μ��񽺽���]");
			com = new LoginService();
			nextpage = com.execute(request, response);
		}

		else if(command.equals("JoinServiceCon.do")) {
//			1. com��ü�� JoinService(); ��ü ����ֱ�
//			2. com�� �ִ� execute() �޼ҵ� ȣ���ؼ�
//			3. ���ϰ� nextpage�� ����ֱ�
			System.out.println("[ȸ�����Լ��񽺽���]");
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
//			System.out.println(" ���� ");
//			com = new WriteBoardService();
//			nextpage = com.execute(request, response);
//		}
		//else if ��������
		
		if(nextpage != null) {
		response.sendRedirect(nextpage);
		}
		
	}//service�޼ҵ�

}
}
