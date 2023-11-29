package library.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

import library.dao.fileDAO;
import library.dto.fileDTO;

public class FileuploadService {

	private String path = "c://upload";
	private int max_size = 1024*1000;
	private String encoding = "UTF-8";
	
	public FileuploadService() {
	}
		
	public FileuploadService(String path, int max_size, String encoding) {
		this.path = path;
		this.max_size = max_size;
		this.encoding = encoding;
	}

	
	// 업로드된 파일이름 , 카테고리
	public MultipartRequest fileUpload(HttpServletRequest request, String uploadFilename) {
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, this.path, this.max_size, this.encoding);
			
			
			if(uploadFilename!=null && !uploadFilename.equals("")) {
				
			String newfilename = fileRename(uploadFilename);
			
			fileDTO filedto = new fileDTO();
			fileDAO filedao = new fileDAO();
			filedto.setOfile(uploadFilename);
			filedto.setSfile(newfilename);
			// filedto.setCate(cate);
			filedto.setName("1");
			filedto.setPostdate("1");
			filedto.setFile_no("1");
			
			filedao.regFile(filedto);
			}
			return mr;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mr;
	}
	
	/*
	 * 
	 * 파일의 이름을 변경하고 변경된 파일의 이름을 반영함
	 * 
	 * 
	 * */
	public String fileRename(String uploadFilename) {
		String newFileName="";
		
		fileDTO filedto = new fileDTO();
			
			// 대문자 H -> 0~23 대문자 S -> 초단위의 밀리세컨드
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			// 첨부파일의 확장자
			String ext = uploadFilename.substring(uploadFilename.lastIndexOf("."));
			
			// 원본 파읾 명
			String oFileName = uploadFilename.substring(0, uploadFilename.lastIndexOf("."));
			
			// 새로운 파일 면
			newFileName = oFileName+"_"+now+ext;
			System.out.println(newFileName);
			
			// 디렉토리
			File oldFile = new File("c:/upload/" + uploadFilename);
			File newFile = new File("c:/upload/" + newFileName);
			// 파일이름 변경
			oldFile.renameTo(newFile);
			
			// 원본파일명과 변경된 파일명을 각 DTO에 저장
			filedto.setOfile(uploadFilename);
			filedto.setSfile(newFileName);
			
			return newFileName;
	}
}
