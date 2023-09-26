package meokjang.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meokjang.service.MemberService;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("memberController 서블릿의 doGet() 메소드 실행");
		actionDo(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("memberController 서블릿의 doPost() 메소드 실행");
		actionDo(request, response);

	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("memberController 서블릿의 actionDo() 메소드 실행");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String ID = request.getParameter("ID").trim();
		
		// System.out.println(ID); //정상
		int result = MemberService.getInstance().IDCheck(ID);
		// 1있다. 0 없다.
		System.out.println(result);
		
		
		response.getWriter().write(result + "");

	}
		
		
		
		

}