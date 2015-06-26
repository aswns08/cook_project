package kr.co.cooks.vo;

import java.sql.Timestamp;

public class ReviewFileListVO {
	
	private int re_Num;
	private String id;
	private String re_Content;
	private Timestamp re_Date;
	private int re_Grade;
	private int re_Dept;
	private int re_Position;
	private int f_Num;
	private int file_Num;
	private String originFileName;
	private String saveFileName;
	private long fileSize;
	
	
	@Override
	public String toString() {
		return "ReviewFileListVO [re_Num=" + re_Num + ", id=" + id
				+ ", re_Content=" + re_Content + ", re_Date=" + re_Date
				+ ", re_Grade=" + re_Grade + ", re_Dept=" + re_Dept
				+ ", re_Position=" + re_Position + ", f_Num=" + f_Num
				+ ", file_Num=" + file_Num + ", originFileName="
				+ originFileName + ", saveFileName=" + saveFileName
				+ ", fileSize=" + fileSize + "]";
	}


	public int getRe_Num() {
		return re_Num;
	}


	public void setRe_Num(int re_Num) {
		this.re_Num = re_Num;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getRe_Content() {
		return re_Content;
	}


	public void setRe_Content(String re_Content) {
		this.re_Content = re_Content;
	}


	public Timestamp getRe_Date() {
		return re_Date;
	}


	public void setRe_Date(Timestamp re_Date) {
		this.re_Date = re_Date;
	}


	public int getRe_Grade() {
		return re_Grade;
	}


	public void setRe_Grade(int re_Grade) {
		this.re_Grade = re_Grade;
	}


	public int getRe_Dept() {
		return re_Dept;
	}


	public void setRe_Dept(int re_Dept) {
		this.re_Dept = re_Dept;
	}


	public int getRe_Position() {
		return re_Position;
	}


	public void setRe_Position(int re_Position) {
		this.re_Position = re_Position;
	}


	public int getF_Num() {
		return f_Num;
	}


	public void setF_Num(int f_Num) {
		this.f_Num = f_Num;
	}


	public int getFile_Num() {
		return file_Num;
	}


	public void setFile_Num(int file_Num) {
		this.file_Num = file_Num;
	}


	public String getOriginFileName() {
		return originFileName;
	}


	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}


	public String getSaveFileName() {
		return saveFileName;
	}


	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}


	public long getFileSize() {
		return fileSize;
	}


	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	
	
	
	
	
	
	

}
