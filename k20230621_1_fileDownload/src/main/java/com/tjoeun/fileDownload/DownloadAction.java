package com.tjoeun.fileDownload;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownloadAction")
public class DownloadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DownloadAction() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("get 방식으로 요쳥될 때 자동으로 실행된다.");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	System.out.println("post 방식으로 요쳥될 때 자동으로 실행된다.");
	//	request.setCharacterEncoding("UTF-8");
	//	System.out.println(request.getParameter("name"));
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//System.out.println("액션두 실행");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String filename = request.getParameter("file");
	//	System.out.println(getServletContext().getRealPath("./upload/"));
		String uploadDirectory = getServletContext().getRealPath("./upload/") + filename;
	//	System.out.println(uploadDirectory);
		File file = new File(uploadDirectory);
		
		String mimeType = getServletContext().getMimeType(file.toString());
		System.out.println(mimeType);
		
		if(mimeType == null) {
			response.setContentType("application/octet-stre");
		}
		
		String downloadName = "";
		if (request.getHeader("user-agent").indexOf("MSIE") == -1) {
			
			downloadName = new String(filename.getBytes("UTF-8"), "8859_1");
		}else {
			downloadName = new String(filename.getBytes("EUC-KR"), "8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename\"" + downloadName + "\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		
		ServletOutputStream outputStream = response.getOutputStream();
		
		byte[] b = new byte[1024];
		int data = 0;
		
		while ((data = fileInputStream.read(b, 0, b.length)) != -1) {
			outputStream.write(b, 0, data);
		}
		outputStream.flush();
		outputStream.close();
		fileInputStream.close();
	}

}





































