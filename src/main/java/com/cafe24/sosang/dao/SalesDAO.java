package com.cafe24.sosang.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.SalesAllDTO;
import com.cafe24.sosang.dto.SalesDTO;
import com.cafe24.sosang.dto.SalesDayDTO;

@Repository("salesDAO")
public class SalesDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private String Namespace = "org.sales.mappers.sales";
	
	// 총매출
	public SalesDTO selectSalesFiv(AreaDTO adto) throws Exception {
		System.out.println("SalesDAO................Mapper호출.........");
		return sqlSession.selectOne(Namespace + ".selectSalesFiv", adto);
	}
	public SalesDTO selectSalesFou(AreaDTO adto) {
		return sqlSession.selectOne(Namespace + ".selectSalesFou", adto);
	}
	public SalesDTO selectSalesThr(AreaDTO adto) {
		return sqlSession.selectOne(Namespace + ".selectSalesThr", adto);
	}
	public SalesDTO selectSalesTwo(AreaDTO adto) {
		return sqlSession.selectOne(Namespace + ".selectSalesTwo", adto);
	}
	public SalesDTO selectSalesOne(AreaDTO adto) {
		return sqlSession.selectOne(Namespace + ".selectSalesOne", adto);
	}
	
	// 매출 업뎃
	public void updatesalesFiv(SalesDTO dto) {
		sqlSession.update(Namespace + ".updateSalesFiv", dto);
	}
	public void updatesalesFou(SalesDTO dto) {
		sqlSession.update(Namespace + ".updateSalesFou", dto);
	}
	public void updatesalesThr(SalesDTO dto) {
		sqlSession.update(Namespace + ".updateSalesThr", dto);
	}
	public void updatesalesTwo(SalesDTO dto) {
		sqlSession.update(Namespace + ".updateSalesTwo", dto);
	}
	public void updatesalesOne(SalesDTO dto) {
		sqlSession.update(Namespace + ".updateSalesOne", dto);
	}
	
	// 총 매출 차트 데이터
	public List<SalesAllDTO> selectSalesAll() {
		List<SalesAllDTO> aList = sqlSession.selectList(Namespace + ".selectSalesAll");
		return aList;
	}
	
	// 나머지 매출데이터
	public SalesDTO selectSalesData(AreaDTO adto) {
		return sqlSession.selectOne(Namespace + ".selectSalesData", adto);
	}
	
	// 주중,주말,요일 업뎃
	public void updatesalesDayMon(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesDayMon", dto);
	}
	public void updatesalesDayTue(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesDayTue", dto);
	}
	public void updatesalesDayWed(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesDayWed", dto);
	}
	public void updatesalesDayThu(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesDayThu", dto);
	}
	public void updatesalesDayFri(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesDayFri", dto);
	}
	public void updatesalesDaySat(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesDaySat", dto);
	}
	public void updatesalesDaySun(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesDaySun", dto);
	}
	
	// 요일 매출 차트 데이터
	public List<SalesDayDTO> selectSalesDay() {
		List<SalesDayDTO> dList = sqlSession.selectList(Namespace + ".selectSalesDay");
		return dList;
	}
	
	// 시간대별 업뎃
	public void updatesalesTimeFir(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesTimeFir", dto);
	}
	public void updatesalesTimeSec(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesTimeSec", dto);
	}
	public void updatesalesTimeThi(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesTimeThi", dto);
	}
	public void updatesalesTimeFou(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesTimeFou", dto);
	}
	public void updatesalesTimeFif(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesTimeFif", dto);
	}
	public void updatesalesTimeSix(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesTimeSix", dto);
	}
	
	// 시간 매출 차트 데이터
	public List<SalesDayDTO> selectSalesTime() {
		List<SalesDayDTO> tList = sqlSession.selectList(Namespace + ".selectsalesTime");
		return tList;
	}
	
	// 연령별 업뎃
	public void updatesalesAgeM(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesAgeM", dto);
	}
	public void updatesalesAgeFm(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesAgeFm", dto);
	}
	public void updatesalesAgeOne(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesAgeOne", dto);
	}
	public void updatesalesAgeTwo(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesAgeTwo", dto);
	}
	public void updatesalesAgeThr(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesAgeThr", dto);
	}
	public void updatesalesAgeFor(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesAgeFor", dto);
	}
	public void updatesalesAgeFiv(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesAgeFiv", dto);
	}
	public void updatesalesAgeSix(SalesDTO dto) {
		sqlSession.update(Namespace + ".updatesalesAgeSix", dto);
	}
	
	// 연령별 매출 차트 데이터
	public List<SalesDayDTO> selectSalesGen() {
		List<SalesDayDTO> gList = sqlSession.selectList(Namespace + ".selectSalesGen");
		return gList;
	}
	
	public List<SalesDayDTO> selectSalesAge() {
		List<SalesDayDTO> ageList = sqlSession.selectList(Namespace + ".selectSalesAge");
		return ageList;
	}

}
