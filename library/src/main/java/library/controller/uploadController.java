package library.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import library.dao.fileDAO;
import library.dto.fileDTO;

@WebServlet("/upload")
public class uploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		fileDAO dao = new fileDAO();
		List<fileDTO> list = dao.getList();
		System.out.println(list);
		request.setAttribute("list", list);
		dao.close();
		request.getRequestDispatcher("/lib/uploadList.jsp").forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("request.getParamater() : " + request.getParameter("title"));
		
		
		// 업로드된 파일의 정보를 출력
		// 경로 설정
		
		// 1. MultipartRequest 객체 생성
		/*
		 * 요청 파일을 해당 경로에 저장
		 * 	- 파일을 저장할 경로를 지정해주어야 함
		 * 	- 파일의 최대 사이즈를 지정할 수 있다.
		 * 	- 한글깨짐이 발생할 수 있으므로 인코딩 타입을 지정
		 * 
		 * 	객체가 정상적으로 생성되면 파일은 자동으로 지정경로에 저장된다.
		 * 	생성자의 매개변수로 저장경로, 파일의 최대크기, 인코딩방식을 지정
		 * 
		 */
		MultipartRequest mr = new MultipartRequest(request, "c:/upload", 1024*1000, "UTF-8");
		
		// enctype타입을 지정하게 되면 request.getParamater() 로 가져올 수 없음
		// mr.getParameter("title");
		
		/*
		 * System.out.println("mr.getParameter(\"name\") : " + mr.getParameter("name"));
		 * System.out.println("mr.getParameter(\"title\") : " +
		 * mr.getParameter("title"));
		 * System.out.println("mr.getParameter(\"category\") : " +
		 * mr.getParameter("category"));
		 */

		
		// 요청 정보를 dto에 저장해야함
		fileDTO filedto = new fileDTO();
		
		filedto.setName(mr.getParameter("name"));
		filedto.setTitle(mr.getParameter("title"));
		
		// 배열로 받음
		filedto.setCate(mr.getParameterValues("category"));
		
		
		// name 속성으로 받을 수 있음
		String filename = mr.getFilesystemName("attachedFile");

		/*
		 * 파일이 첨부된 경우
		 *  - 중복된 파일의 경우 기존에 저장된 파일이 소실될 수 있음
		 *  - 파일을 저장할때는 년/월/일 폴더를 생성 후 파일명에 날짜를 붙여서 저장할 수 있음
		 *  - 파일을 저장할때 파일명_날짜시간.확장자 or 날짜시간_파일명.확장자
		 */
		
		if(filename!=null && !filename.equals("")) {
			
			// 대문자 H -> 0~23 대문자 S -> 초단위의 밀리세컨드
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			// 첨부파일의 확장자
			String ext = filename.substring(filename.lastIndexOf("."));
			
			// 원본 파읾 명
			String oFileName = filename.substring(0, filename.lastIndexOf("."));
			
			// 새로운 파일 면
			String newFileName = oFileName+"_"+now+ext;
			System.out.println(newFileName);
			
			// 디렉토리
			File oldFile = new File("c:/upload/" + filename);
			File newFile = new File("c:/upload/" + newFileName);
			// 파일이름 변경
			oldFile.renameTo(newFile);
			
			// 원본파일명과 변경된 파일명을 각 DTO에 저장
			filedto.setOfile(filename);
			filedto.setSfile(newFileName);
			
		}
		
		System.out.println("filename : " + filename);
		System.out.println("파일명 : " + filename);
		
		// 입력된 내용을 DB에 저장합니다.
		fileDAO dao = new fileDAO();
		
		int res = dao.regFile(filedto);
		
		if(res==1) {
			request.setAttribute("msg", "등록되었습니다");
			request.setAttribute("url", "/upload");
		}
		else {
			request.setAttribute("msg", "등록 중 예외사항이 발생하였습니다");
		}
		
		dao.close();
		
		// request.getRequestDispatcher("/lib/msgbox.jsp").forward(request, response);
		response.sendRedirect("/upload");
	}

}
