package board;

import java.util.Date;

public class CommitVO {
	int comNo;
	String comContent;
	String comWriter;
	Date comRegDate;
	int no;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public String getComWriter() {
		return comWriter;
	}
	public void setComWriter(String comWriter) {
		this.comWriter = comWriter;
	}
	public Date getComRegDate() {
		return comRegDate;
	}
	public void setComRegDate(Date comRegDate) {
		this.comRegDate = comRegDate;
	}
	
	
}
