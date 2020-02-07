package com.cafe24.sosang.service;

import org.json.simple.JSONObject;


import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.SalesDTO;

public interface SalesService {
	
	// 총매출
	public SalesDTO selectSalesFiv(AreaDTO adto) throws Exception;
	public SalesDTO selectSalesFou(AreaDTO adto) throws Exception;
	public SalesDTO selectSalesThr(AreaDTO adto) throws Exception;
	public SalesDTO selectSalesTwo(AreaDTO adto) throws Exception;
	public SalesDTO selectSalesOne(AreaDTO adto) throws Exception;
	
	// 매출 업뎃
	public void updatesalesFiv(SalesDTO dto) throws Exception;
	public void updatesalesFou(SalesDTO dto) throws Exception;
	public void updatesalesThr(SalesDTO dto) throws Exception;
	public void updatesalesTwo(SalesDTO dto) throws Exception;
	public void updatesalesOne(SalesDTO dto) throws Exception;
	
	// 나머지 매출데이터
	public SalesDTO selectSalesData(AreaDTO adto) throws Exception;
	
	// 주중,주말,요일 업뎃
	public void updatesalesDayMon(SalesDTO dto) throws Exception;
	public void updatesalesDayTue(SalesDTO dto) throws Exception;
	public void updatesalesDayWed(SalesDTO dto) throws Exception;
	public void updatesalesDayThu(SalesDTO dto) throws Exception;
	public void updatesalesDayFri(SalesDTO dto) throws Exception;
	public void updatesalesDaySat(SalesDTO dto) throws Exception;
	public void updatesalesDaySun(SalesDTO dto) throws Exception;
	
	// 시간대별 업뎃
	public void updatesalesTimeFir(SalesDTO dto) throws Exception;
	public void updatesalesTimeSec(SalesDTO dto) throws Exception;
	public void updatesalesTimeThi(SalesDTO dto) throws Exception;
	public void updatesalesTimeFou(SalesDTO dto) throws Exception;
	public void updatesalesTimeFif(SalesDTO dto) throws Exception;
	public void updatesalesTimeSix(SalesDTO dto) throws Exception;
	
	// 연령별 업뎃
	public void updatesalesAgeM(SalesDTO dto) throws Exception;
	public void updatesalesAgeFm(SalesDTO dto) throws Exception;
	public void updatesalesAgeOne(SalesDTO dto) throws Exception;
	public void updatesalesAgeTwo(SalesDTO dto) throws Exception;
	public void updatesalesAgeThr(SalesDTO dto) throws Exception;
	public void updatesalesAgeFor(SalesDTO dto) throws Exception;
	public void updatesalesAgeFiv(SalesDTO dto) throws Exception;
	public void updatesalesAgeSix(SalesDTO dto) throws Exception;
	
	// 구글차트
	public JSONObject getChartData();
}
