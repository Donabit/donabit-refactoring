package check;

import org.springframework.web.multipart.MultipartFile;

public class CheckDTO {
	String nickname, checktime, checktitle, checkdesc, checkimg2, checkid;
	int chnum, checknum;
	MultipartFile checkimg;
	
	public String getCheckimg2() {
		return checkimg2;
	}
	public void setCheckimg2(String checkimg2) {
		this.checkimg2 = checkimg2;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getChecktime() {
		return checktime;
	}
	public void setChecktime(String checktime) {
		this.checktime = checktime;
	}
	public String getChecktitle() {
		return checktitle;
	}
	public void setChecktitle(String checktitle) {
		this.checktitle = checktitle;
	}
	public String getCheckdesc() {
		return checkdesc;
	}
	public void setCheckdesc(String checkdesc) {
		this.checkdesc = checkdesc;
	}
	public int getChnum() {
		return chnum;
	}
	public void setChnum(int chnum) {
		this.chnum = chnum;
	}
	public int getChecknum() {
		return checknum;
	}
	public void setChecknum(int checknum) {
		this.checknum = checknum;
	}
	public MultipartFile getCheckimg() {
		return checkimg;
	}
	public void setCheckimg(MultipartFile checkimg) {
		this.checkimg = checkimg;
	}
	public String getCheckid() {
		return checkid;
	}
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	
	
}
