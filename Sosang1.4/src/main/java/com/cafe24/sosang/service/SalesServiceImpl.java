package com.cafe24.sosang.service;


import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.sosang.dao.SalesDAO;
import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.SalesAllDTO;
import com.cafe24.sosang.dto.SalesDTO;
import com.cafe24.sosang.dto.SalesDayDTO;

@Service("salesService")
public class SalesServiceImpl implements SalesService {

	@Autowired
	private SalesDAO salesDAO;
	
	// 총매출
	@Override
	public SalesDTO selectSalesFiv(AreaDTO adto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................selectSalesFiv");
		return salesDAO.selectSalesFiv(adto);
	}
	@Override
	public SalesDTO selectSalesFou(AreaDTO adto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................selectSalesFou");
		return salesDAO.selectSalesFou(adto);
	}
	@Override
	public SalesDTO selectSalesThr(AreaDTO adto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................selectSalesThr");
		return salesDAO.selectSalesThr(adto);
	}
	@Override
	public SalesDTO selectSalesTwo(AreaDTO adto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................selectSalesTwo");
		return salesDAO.selectSalesTwo(adto);
	}
	@Override
	public SalesDTO selectSalesOne(AreaDTO adto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................selectSalesOne");
		return salesDAO.selectSalesOne(adto);
	}
	
	// 매출 업뎃
	@Override
	public void updatesalesFiv(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesFiv");
		salesDAO.updatesalesFiv(dto);
	}
	@Override
	public void updatesalesFou(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesFou");
		salesDAO.updatesalesFou(dto);
	}
	@Override
	public void updatesalesThr(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesThr");
		salesDAO.updatesalesThr(dto);
	}
	@Override
	public void updatesalesTwo(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesTwo");
		salesDAO.updatesalesTwo(dto);
	}
	@Override
	public void updatesalesOne(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesOne");
		salesDAO.updatesalesOne(dto);
	}
	
	// 나머지 매출데이터
	@Override
	public SalesDTO selectSalesData(AreaDTO adto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................selectSalesData");
		return salesDAO.selectSalesData(adto);
	}
	
	// 주중,주말,요일 업뎃
	@Override
	public void updatesalesDayMon(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesDayMon");
		salesDAO.updatesalesDayMon(dto);
	}
	@Override
	public void updatesalesDayTue(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesDayTue");
		salesDAO.updatesalesDayTue(dto);
	}
	@Override
	public void updatesalesDayWed(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesDayWed");
		salesDAO.updatesalesDayWed(dto);
	}
	@Override
	public void updatesalesDayThu(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesDayThu");
		salesDAO.updatesalesDayThu(dto);
	}
	@Override
	public void updatesalesDayFri(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesDayFri");
		salesDAO.updatesalesDayFri(dto);
	}
	@Override
	public void updatesalesDaySat(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesDaySat");
		salesDAO.updatesalesDaySat(dto);
	}
	@Override
	public void updatesalesDaySun(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesDaySun");
		salesDAO.updatesalesDaySun(dto);
	}
	
	// 시간대별 업뎃
	@Override
	public void updatesalesTimeFir(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesTimeFir");
		salesDAO.updatesalesTimeFir(dto);		
	}
	@Override
	public void updatesalesTimeSec(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesTimeSec");
		salesDAO.updatesalesTimeSec(dto);
	}
	@Override
	public void updatesalesTimeThi(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesTimeThi");
		salesDAO.updatesalesTimeThi(dto);
	}
	@Override
	public void updatesalesTimeFou(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesTimeFou");
		salesDAO.updatesalesTimeFou(dto);
	}
	@Override
	public void updatesalesTimeFif(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesTimeFif");
		salesDAO.updatesalesTimeFif(dto);
	}
	@Override
	public void updatesalesTimeSix(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesTimeSix");
		salesDAO.updatesalesTimeSix(dto);
	}

	// 연령별 업뎃
	@Override
	public void updatesalesAgeM(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesAgeM");
		salesDAO.updatesalesAgeM(dto);
	}
	@Override
	public void updatesalesAgeFm(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesAgeFm");
		salesDAO.updatesalesAgeFm(dto);
	}
	@Override
	public void updatesalesAgeOne(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesAgeOne");
		salesDAO.updatesalesAgeOne(dto);
	}
	@Override
	public void updatesalesAgeTwo(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesAgeTwo");
		salesDAO.updatesalesAgeTwo(dto);
	}
	@Override
	public void updatesalesAgeThr(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesAgeThr");
		salesDAO.updatesalesAgeThr(dto);
	}
	@Override
	public void updatesalesAgeFor(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesAgeFor");
		salesDAO.updatesalesAgeFor(dto);
	}
	@Override
	public void updatesalesAgeFiv(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesAgeFiv");
		salesDAO.updatesalesAgeFiv(dto);
	}
	@Override
	public void updatesalesAgeSix(SalesDTO dto) throws Exception {
		System.out.println("SalesServiceImpl.............DAO호출................updatesalesAgeSix");
		salesDAO.updatesalesAgeSix(dto);
	}
	
	// 구글차트
	@Override
	public JSONObject getChartData() {
		System.out.println("SalesServiceImpl.............DAO호출................getChartData");
		
		List<SalesAllDTO> aList = salesDAO.selectSalesAll();
		List<SalesDayDTO> dList = salesDAO.selectSalesDay(); 
		List<SalesDayDTO> tList = salesDAO.selectSalesTime(); 
		List<SalesDayDTO> gList = salesDAO.selectSalesGen(); 
		List<SalesDayDTO> ageList = salesDAO.selectSalesAge(); 
		
		// selectSalesAll()
		JSONArray barlist = new JSONArray();
		// selectSalesDay()
		JSONArray barlist2 = new JSONArray();
		// selectSalesTime()
		JSONArray barlist3 = new JSONArray();
		// selectSalesGen()
		JSONArray barlist4 = new JSONArray();
		// selectSalesAge()
		JSONArray barlist5 = new JSONArray();
		
		// 최종 리턴 제이슨
		JSONObject responseObj = new JSONObject();
		
		// Arr에 들어가는 Obj하나
        JSONObject barObj = null;
        
        // selectSalesAll()
        for(int i = 0; i < aList.size(); i++) {
        	String part = aList.get(i).getPart();
        	long amt = Long.parseLong(aList.get(i).getAmt());
        	long co = Long.parseLong(aList.get(i).getCo());
            barObj = new JSONObject();
            barObj.put("part", part);
            barObj.put("amt", (long)amt);
            barObj.put("co", (long)co);
            barlist.add(barObj);
        }
        
        // selectSalesDay()
        for(int i = 0; i < dList.size(); i++) {
        	String part = dList.get(i).getPart();
        	long amt = Long.parseLong(dList.get(i).getAmt());
        	long rate = Long.parseLong(dList.get(i).getRate());
            barObj = new JSONObject();
            barObj.put("part", part);
            barObj.put("amt", (long)amt);
            barObj.put("rate", (long)rate);
            barlist2.add(barObj);
        }
        
        // selectSalesTime()
        for(int i = 0; i < tList.size(); i++) {
        	String part = tList.get(i).getPart();
        	long amt = Long.parseLong(tList.get(i).getAmt());
        	long rate = Long.parseLong(tList.get(i).getRate());
            barObj = new JSONObject();
            barObj.put("part", part);
            barObj.put("amt", (long)amt);
            barObj.put("rate", (long)rate);
            barlist3.add(barObj);
        }
        
        // selectSalesGen()
        for(int i = 0; i < gList.size(); i++) {
        	String part = gList.get(i).getPart();
        	long amt = Long.parseLong(gList.get(i).getAmt());
        	barObj = new JSONObject();
        	barObj.put("part", part);
        	barObj.put("amt", (long)amt);
        	barlist4.add(barObj);
        }
        
        // selectSalesAge()
        for(int i = 0; i < ageList.size(); i++) {
        	String part = ageList.get(i).getPart();
        	long rate = Long.parseLong(ageList.get(i).getRate());
            barObj = new JSONObject();
            barObj.put("part", part);
            barObj.put("rate", (long)rate);
            barlist5.add(barObj);
        }
        
        responseObj.put("barlist", barlist);
        responseObj.put("barlist2", barlist2);
        responseObj.put("barlist3", barlist3);
        responseObj.put("barlist4", barlist4);
        responseObj.put("barlist5", barlist5);
        
		return responseObj;
	}
	
}
