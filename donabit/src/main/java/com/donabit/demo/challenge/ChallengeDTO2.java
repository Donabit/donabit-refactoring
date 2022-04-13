package com.donabit.demo.challenge;

import org.springframework.web.multipart.MultipartFile;

public class ChallengeDTO2 {
	int chnum, chsuccess, chdonate, chexp, chmaxp, donatepay;
	String chname, chdesc, chsdate, chedate, donateco;
	MultipartFile chimg;
	public int getChnum() {
		return chnum;
	}
	public void setChnum(int chnum) {
		this.chnum = chnum;
	}
	public int getChsuccess() {
		return chsuccess;
	}
	public void setChsuccess(int chsuccess) {
		this.chsuccess = chsuccess;
	}
	public int getChdonate() {
		return chdonate;
	}
	public void setChdonate(int chdonate) {
		this.chdonate = chdonate;
	}
	public int getChexp() {
		return chexp;
	}
	public void setChexp(int chexp) {
		this.chexp = chexp;
	}
	public int getChmaxp() {
		return chmaxp;
	}
	public void setChmaxp(int chmaxp) {
		this.chmaxp = chmaxp;
	}
	public String getChname() {
		return chname;
	}
	public void setChname(String chname) {
		this.chname = chname;
	}
	public String getChdesc() {
		return chdesc;
	}
	public void setChdesc(String chdesc) {
		this.chdesc = chdesc;
	}
	public String getChsdate() {
		return chsdate;
	}
	public void setChsdate(String chsdate) {
		this.chsdate = chsdate;
	}
	public String getChedate() {
		return chedate;
	}
	public void setChedate(String chedate) {
		this.chedate = chedate;
	}
	public MultipartFile getChimg() {
		return chimg;
	}
	public void setChimg(MultipartFile chimg) {
		this.chimg = chimg;
	}
	public int getDonatepay() {
		return donatepay;
	}
	public void setDonatepay(int donatepay) {
		this.donatepay = donatepay;
	}
	public String getDonateco() {
		return donateco;
	}
	public void setDonateco(String donateco) {
		this.donateco = donateco;
	}
	
	
	
}
