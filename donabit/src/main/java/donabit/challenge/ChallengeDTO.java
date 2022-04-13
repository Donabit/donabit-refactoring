package donabit.challenge;

public class ChallengeDTO {
	String chnum, chname, chdonate, chdesc, chimg, chsuccess, chexp, chmaxp, chsdate, chedate, checknum;
	
	public ChallengeDTO() {}

	public ChallengeDTO(String chnum, String chname, String chdonate, String chdesc, String chimg, String chsuccess,
			String chexp, String chmaxp, String chsdate, String chedate, String checknum) {
		super();
		this.chnum = chnum;
		this.chname = chname;
		this.chdonate = chdonate;
		this.chdesc = chdesc;
		this.chimg = chimg;
		this.chsuccess = chsuccess;
		this.chexp = chexp;
		this.chmaxp = chmaxp;
		this.chsdate = chsdate;
		this.chedate = chedate;
		this.checknum = checknum;
	}

	public String getChnum() {
		return chnum;
	}

	public void setChnum(String chnum) {
		this.chnum = chnum;
	}

	public String getChname() {
		return chname;
	}

	public void setChname(String chname) {
		this.chname = chname;
	}

	public String getChdonate() {
		return chdonate;
	}

	public void setChdonate(String chdonate) {
		this.chdonate = chdonate;
	}

	public String getChdesc() {
		return chdesc;
	}

	public void setChdesc(String chdesc) {
		this.chdesc = chdesc;
	}

	public String getChimg() {
		return chimg;
	}

	public void setChimg(String chimg) {
		this.chimg = chimg;
	}

	public String getChsuccess() {
		return chsuccess;
	}

	public void setChsuccess(String chsuccess) {
		this.chsuccess = chsuccess;
	}

	public String getChexp() {
		return chexp;
	}

	public void setChexp(String chexp) {
		this.chexp = chexp;
	}

	public String getChmaxp() {
		return chmaxp;
	}

	public void setChmaxp(String chmaxp) {
		this.chmaxp = chmaxp;
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

	public String getChecknum() {
		return checknum;
	}

	public void setChecknum(String checknum) {
		this.checknum = checknum;
	}

	
	

}
