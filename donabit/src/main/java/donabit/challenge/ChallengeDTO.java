package donabit.challenge;

public class ChallengeDTO {
	String chnum, chnum2, chname, chdonate, chdesc, chimg, chsuccess, chexp, chmaxp, chsdate, chedate, checknum, nickname, nickname2, personalpf;
	
	public ChallengeDTO() {}

	public ChallengeDTO(String chnum, String chnum2, String chname, String chdonate, String chdesc, String chimg, String chsuccess, String chexp,
			String chmaxp, String chsdate, String chedate, String checknum, String nickname, String nickname2, String personalpf) {
		super();
		this.chnum = chnum;
		this.chnum2 = chnum2;
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
		this.nickname = nickname;
		this.nickname2 = nickname2;
		this.personalpf = personalpf;
	}

	public ChallengeDTO(String chnum, String chnum2, String nickname, String personalpf) {
		super();
		this.chnum = chnum;
		this.chnum2 = chnum2;
		this.nickname = nickname;
		this.personalpf = personalpf;
	}

	public String getChnum() {
		return chnum;
	}

	public void setChnum(String chnum) {
		this.chnum = chnum;
	}

	public String getChnum2() {
		return chnum2;
	}

	public void setChnum2(String chnum2) {
		this.chnum2 = chnum2;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNickname2() {
		return nickname2;
	}

	public void setNickname2(String nickname2) {
		this.nickname2 = nickname2;
	}

	public String getPersonalpf() {
		return personalpf;
	}

	public void setPersonalpf(String personalpf) {
		this.personalpf = personalpf;
	}

	
	

}
