package library.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import library.dao.fileDAO;
import library.dao.libraryDAO;
import library.dto.fileDTO;
import library.service.FileuploadService;

@WebServlet("/uploadProcess")
public class uploadProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일 업로드 객체
		MultipartRequest mr = new MultipartRequest(request, "c://upload", 1024*1000, "UTF-8"); 
		// input의 file 속성 이름으로 가져오기
		String filename = mr.getFilesystemName("formFile"); 		
		System.out.println(filename);
		
		FileuploadService fileuploadservice = new FileuploadService();
		MultipartRequest mrs = fileuploadservice.fileUpload(request, filename);

		

			
	}
}
