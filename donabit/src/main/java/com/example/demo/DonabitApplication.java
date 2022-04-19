package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.donabit.board.BoardController;
import com.donabit.board.BoardDAO;
import com.donabit.demo.challenge.ChallengeController2;
import com.donabit.demo.challenge.ChallengeDAO2;

import check.CheckController;
import check.CheckDAO;
import donabit.challenge.ChallengeController;
import donabit.challenge.ChallengeDAO;
import joinlogin.MemberController;
import joinlogin.MemberDAO;

@SpringBootApplication
@ComponentScan //빈으로 등록 될 준비를 마친 클래스들을 스캔하여, 빈으로 등록해주는 것
@ComponentScan(basePackageClasses = ChallengeController2.class)
@MapperScan(basePackageClasses = ChallengeDAO2.class)
@ComponentScan(basePackageClasses = ChallengeController.class)
@MapperScan(basePackageClasses = ChallengeDAO.class)
@ComponentScan(basePackageClasses = CheckController.class)
@MapperScan(basePackageClasses = CheckDAO.class)
@ComponentScan(basePackageClasses = MemberController.class)
@MapperScan(basePackageClasses = MemberDAO.class)
@ComponentScan(basePackageClasses = BoardController.class)
@MapperScan(basePackageClasses = BoardDAO.class)
public class DonabitApplication {

	public static void main(String[] args) {
		SpringApplication.run(DonabitApplication.class, args);
	}

}
