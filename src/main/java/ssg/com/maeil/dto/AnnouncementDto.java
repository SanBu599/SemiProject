package ssg.com.maeil.dto;

import java.io.Serializable;

public class AnnouncementDto implements Serializable{
	
	private int seq;
	private int employee_id;
	private String title;
	private String content;
	private String writing_period;
	
	int auth;
	
	public AnnouncementDto() {
	}

	public AnnouncementDto(int seq, int employee_id, String title, String content, String writing_period, int auth) {
		super();
		this.seq = seq;
		this.employee_id = employee_id;
		this.title = title;
		this.content = content;
		this.writing_period = writing_period;
		this.auth = auth;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriting_period() {
		return writing_period;
	}

	public void setWriting_period(String writing_period) {
		this.writing_period = writing_period;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}
	
}
