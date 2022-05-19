package com.donabit.demo.challenge;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.donabit.demo.check.CheckService;
import com.donabit.demo.dto.ChallengeDTO;
import com.donabit.demo.dto.ReportDTO;

@Component
public class ControllerLibrary {
	
	@Autowired
	ChallengeService chservice;
	
	@Autowired
	CheckService ckservice;
	
	public int sumExp(String nickname) {
		List<Integer> exp = chservice.selectexp(nickname);
		return exp.stream().mapToInt(Integer::intValue).sum();
	}
	
	public int calcLevel(String nickname) {
		List<Integer> level = chservice.selectlevel();
		int levelresult = 1;
		// 경험치가 구간이 level 1초과 일때
		for (int i = 0, size = level.size(); i < size; i++) {
			if (level.get(i) < sumExp(nickname)) {
				levelresult++;
			}
		}
		return levelresult > 3 ? 3 : levelresult;
	}
	
	@Scheduled(cron = "0 0 0 * * *") //초 분 시 일 월 요일
	public void scheduleUpdate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<ReportDTO> list = chservice.selectReportCount();
		Date today;
		int reportCnt = 1;
		try {
			today = sdf.parse(sdf.format(date));
			for(ReportDTO dto : list) {
				String toggletimeStr = dto.getToggletime().substring(0, 10);
				Date toggletime = sdf.parse(toggletimeStr);
				long diffSec = (today.getTime() - toggletime.getTime()) / 1000;
				long diffDay = diffSec / (24*60*60); //하루 차이
				if(dto.getReport() >= reportCnt && toggletime.compareTo(today) < diffDay) {
					ckservice.deletetoggle(dto.getCheckid());
					ckservice.deletecheck(dto.getCheckid());
					System.out.println("삭제 완료");
				}
			}		
		} catch (ParseException e) {
			e.printStackTrace();
		}

	}

}
	

