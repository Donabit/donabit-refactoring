package com.donabit.demo.dto;

import lombok.Data;

@Data
public class ChallengeDTO {
	String chnum, chnum2, chname, chdonate, chdesc, chimg, chsuccess, chexp, chmaxp, chsdate, chedate, checknum,
			donatepay, donateco, nickname, nickname2, personalpf, checkid, like, likes, report, checktitle, checkdesc, checkimg,
			checkimg2, checktime, count, avatar, cno, content, cdate;
	int viewcount;
	int level2;

	public ChallengeDTO() {
	}

	public ChallengeDTO(String chnum, String chnum2, String chname, String chdonate, String chdesc, String chimg,
			String chsuccess, String chexp, String chmaxp, String chsdate, String chedate,
			String checknum, String donatepay, String donateco, String nickname, String nickname2, String personalpf,
			String checkid, String like, String report, String checktitle, String checkdesc, String checkimg,
			String checkimg2, String checktime, String count, String likes, String avatar, int viewcount) {
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
		this.donatepay = donatepay;
		this.donateco = donateco;
		this.nickname = nickname;
		this.nickname2 = nickname2;
		this.personalpf = personalpf;
		this.checkid = checkid;
		this.like = like;
		this.likes = likes;
		this.report = report;
		this.checktitle = checktitle;
		this.checkdesc = checkdesc;
		this.checkimg = checkimg;
		this.checkimg2 = checkimg2;
		this.checktime = checktime;
		this.count = count;
		this.avatar = avatar;
		this.viewcount = viewcount;
	}

	public ChallengeDTO(String chnum, String chnum2, String nickname, String personalpf) {
		super();
		this.chnum = chnum;
		this.chnum2 = chnum2;
		this.nickname = nickname;
		this.personalpf = personalpf;
	}

	@Override
	public String toString() {

		return chnum + "/" + chsdate + "/" + chedate;
	}

}
