package library.dto;

public class fileDTO {

	private String file_no     ;
	private String name        ;
	private String title       ;
	private String cate        ;
	private String ofile       ;
	private String sfile       ;
	private String postdate    ;
	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String[] string) {
		String cates = "";
		for(String num : string) {
			cates += num +",";
		}
		this.cate = cates;
	}
	
	public void setCate(String string) {
		this.cate = string;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	@Override
	public String toString() {
		return "fileDTO [file_no=" + file_no + ", name=" + name + ", title=" + title + ", cate=" + cate + ", ofile="
				+ ofile + ", sfile=" + sfile + ", postdate=" + postdate + "]";
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	
	public fileDTO(String file_no, String name, String title, String cate, String ofile, String sfile,
			String postdate) {
		this.file_no = file_no;
		this.name = name;
		this.title = title;
		this.cate = cate;
		this.ofile = ofile;
		this.sfile = sfile;
		this.postdate = postdate;
	}
	
	public fileDTO() {}

}
