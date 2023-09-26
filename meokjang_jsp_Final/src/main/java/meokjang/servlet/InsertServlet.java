package meokjang.servlet;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import meokjang.service.PartyService;
import meokjang.vo.PartyVO;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("uploadServlet 서블릿의 actionDo() 메소드");
		
		// 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ServletContext servletContext = request.getServletContext();
		
		MultipartRequest multi = new MultipartRequest(
				request,
				servletContext.getRealPath("./upload/"),
				5 * 1024 * 1024,
				"UTF-8",
				new DefaultFileRenamePolicy()
		);
		
		File realFilename = multi.getFile("fileName"); 
		String photo = realFilename.getName();
		String ID = multi.getParameter("ID");;		    
		String nickName = multi.getParameter("nickName");    
		String category = multi.getParameter("category");   
		String location = multi.getParameter("location");   
		String subject = multi.getParameter("subject");    
		String content = multi.getParameter("content");     
		String place = multi.getParameter("place");     
		String partyGender = multi.getParameter("partyGender");      
		String dateObject1 = multi.getParameter("mealDate");
		String dateObject2 = multi.getParameter("mealTime"); 
		String combinedDateTimeString1 = dateObject1 + " " + dateObject2;
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date mealDate = null;
		try {
		    mealDate = dateTimeFormat.parse(combinedDateTimeString1);
		    System.out.println(mealDate);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		
		String dateObject3 = multi.getParameter("limitDate");
		String dateObject4 = multi.getParameter("limitTime");
		String combinedDateTimeString2 = dateObject3 + " " + dateObject4;
		Date limitDate = null;
		try {
		    limitDate = dateTimeFormat.parse(combinedDateTimeString2);
		    System.out.println(limitDate);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		
		String acholchk = multi.getParameter("acholchk");   
		String ip = multi.getParameter("ip");         
		int minLimitAge = (int)Double.parseDouble(multi.getParameter("minLimitAge"));  
		int maxLimitAge = (int)Double.parseDouble(multi.getParameter("maxLimitAge"));   
		int limitNum = Integer.parseInt(multi.getParameter("limitNum")); 
		
		PartyVO vo = new PartyVO(ID, nickName, category, location, subject, content, place, partyGender, mealDate, limitDate, photo, acholchk, ip, minLimitAge, maxLimitAge, limitNum);
		
		PartyService.getInstance().insert(vo);
		response.sendRedirect("list.jsp");
	}
	
}
