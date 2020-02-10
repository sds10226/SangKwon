package com.cafe24.sosang.control;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.sosang.dto.ApartmentDTO;
import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.GenderAndAge_FloatingPopDTO;
import com.cafe24.sosang.dto.Main_FacilitiesDTO;
import com.cafe24.sosang.dto.MylogDTO;
import com.cafe24.sosang.dto.ResidencePopDTO;
import com.cafe24.sosang.dto.SalesDTO;
import com.cafe24.sosang.dto.SalleryManPopDTO;
import com.cafe24.sosang.dto.StoreDTO;
import com.cafe24.sosang.dto.Time_FloatingPopDTO;
import com.cafe24.sosang.dto.Weekly_FloatingPopDTO;
import com.cafe24.sosang.service.LocalService;
import com.cafe24.sosang.service.MemberService;
import com.cafe24.sosang.service.OverallService;
import com.cafe24.sosang.service.PopService;
import com.cafe24.sosang.service.SalesService;
import com.cafe24.sosang.service.StoreService;


@Controller
@RequestMapping("/analysis/*")
public class AnalysisControl {

	
	@Autowired
	private OverallService overallService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private SalesService salesService;
	
	@Autowired
	private PopService popService;
	
	@Autowired
	private LocalService localService;
	
	@Autowired
	private MemberService memberService;

	// 분석페이지 이동
	@RequestMapping(value = "/showData.do")
	public String showData(AreaDTO adto, MylogDTO mldto, HttpSession session) throws Exception {
		System.out.println("analysisControl => 분석 페이지로 이동");
		session.setAttribute("area", adto.getArea());
		session.setAttribute("food", adto.getFood());
		
		String id = (String) session.getAttribute("id");
		if(id != null && id != "") {
			// 검색 시간에 저장할 값 구하기
			Timestamp reg_date = new Timestamp(System.currentTimeMillis());

			// mldto에 있는거 다 가져와서 dao에서 mylog table에 저장.
			mldto.setId((String) session.getAttribute("id"));
			mldto.setArea(adto.getArea());
			mldto.setFood(adto.getFood());
			mldto.setSearch_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(reg_date));
			memberService.reg_mylog(mldto);
		} 
		return "anaysisMenu.jsp";
	}

	// 상권분석
	@RequestMapping(value = "/overallAnalysis.do")
	public String overallAnalysis(AreaDTO adto, Model model, HttpSession session) {
		adto.setArea((String) session.getAttribute("area"));
		adto.setFood((String) session.getAttribute("food"));
		adto.setSelect_year(2019);
		adto.setSelect_quarter(2);
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월dd일 HH시mm분ss초");
		String format_time = format.format(System.currentTimeMillis());
		Map<String, String> map = new HashMap<String, String>();
		map.put("압구정동", "abgoojungdong");
		map.put("청담동", "chungdamdong");
		map.put("대치동", "daechidong");
		map.put("도곡동", "dogokdong");
		map.put("개포동", "gaepodong");
		map.put("일원동", "ilwondong");
		map.put("자곡동", "jagokdong");
		map.put("논현동", "nonhyundong");
		map.put("삼성동", "samsungdong");
		map.put("세곡동", "segokdong");
		map.put("신사동", "sinsadong");
		map.put("수서동", "sooserdong");
		map.put("율현동", "youlhyundong");
		map.put("역삼동", "yuksamdong");

		model.addAttribute("adto", adto);
		model.addAttribute("time", format_time);
		model.addAttribute("map", map.get(adto.getArea()));

		// 1.상권주요정보
		model.addAttribute("all_cnt", overallService.getAllCnt(adto));
		model.addAttribute("select_cnt", overallService.getSelectCnt(adto));
		model.addAttribute("sales", overallService.getSales(adto));
		model.addAttribute("sales_cnt", overallService.getSalesCnt(adto));
		model.addAttribute("res_pop", overallService.getResPop(adto));
		model.addAttribute("sal_pop", overallService.getSalPop(adto));
		model.addAttribute("flo_pop", overallService.getFloPop(adto));
		model.addAttribute("facil_cnt", overallService.getFacilCnt(adto));
		model.addAttribute("school_cnt", overallService.getSchoolCnt(adto));
		model.addAttribute("traffic_cnt", overallService.getTrafficCnt(adto));

		// 2.평가종합
		// 3.평가지수 추이

		// 4.상세평가 지수
		double g1 = overallService.getGrowth1(adto);
		double g2 = overallService.getGrowth2(adto);
		double g3 = overallService.getGrowth3(adto);
		double g4 = overallService.getGrowth4(adto);

		double s1 = overallService.getStability1(adto);
		double s2 = overallService.getStability2(adto);
		double s3 = overallService.getStability3(adto);
		double s4 = overallService.getStability4(adto);

		double b1 = overallService.getBusinessAbility1(adto);
		double b2 = overallService.getBusinessAbility2(adto);
		double b3 = overallService.getBusinessAbility3(adto);
		double b4 = overallService.getBusinessAbility4(adto);
		double b5 = overallService.getBusinessAbility5(adto);
		double b6 = overallService.getBusinessAbility6(adto);

		double p1 = overallService.getPurchasingPower1(adto);
		double p2 = overallService.getPurchasingPower2(adto);
		double p3 = overallService.getPurchasingPower3(adto);

		double h1 = overallService.getHouseArrest1(adto);
		double h2 = overallService.getHouseArrest2(adto);
		double h3 = overallService.getHouseArrest3(adto);

		double gtot = g1 + g2 + g3 + g4;
		double stot = s1 + s2 + s3 + s4;
		double btot = b1 + b2 + b3 + b4 + b5 + b6;
		double ptot = p1 + p2 + p3;
		double htot = h1 + h2 + h3;
		double total = g1 + g2 + g3 + g4 + s1 + s2 + s3 + s4 + b1 + b2 + b3 + b4 + b5 + b6 + p1 + p2 + p3 + h1 + h2
				+ h3;
		int rank;

		if (total >= 70) {
			rank = 1;
		} else if (total >= 57.5) {
			rank = 2;
		} else if (total >= 45) {
			rank = 3;
		} else if (total >= 32.5) {
			rank = 4;
		} else {
			rank = 5;
		}
		// 등급
		model.addAttribute("rank", rank);

		// 총점
		model.addAttribute("gtot", Math.round(gtot * 100) / 100.0);
		model.addAttribute("stot", Math.round(stot * 100) / 100.0);
		model.addAttribute("btot", Math.round(btot * 100) / 100.0);
		model.addAttribute("ptot", Math.round(ptot * 100) / 100.0);
		model.addAttribute("htot", Math.round(htot * 100) / 100.0);
		model.addAttribute("total", Math.round(total * 100) / 100.0);

		// 성장성
		model.addAttribute("growth12", Math.round((g1 + g2) * 100) / 100.0);
		model.addAttribute("growth3", g3);
		model.addAttribute("growth4", g4);
		// 안정성
		model.addAttribute("stability12", Math.round((s1 + s2) * 100) / 100.0);
		model.addAttribute("stability3", s3);
		model.addAttribute("stability4", s4);
		// 영업력
		model.addAttribute("business_ability12", Math.round((b1 + b2) * 100) / 100.0);
		model.addAttribute("business_ability3", b3);
		model.addAttribute("business_ability456", Math.round((b4 + b5 + b6) * 100) / 100.0);
		// 구매력
		model.addAttribute("purchasing_power1", p1);
		model.addAttribute("purchasing_power2", p2);
		model.addAttribute("purchasing_power3", p3);
		// 집객력
		model.addAttribute("house_arrest1", h1);
		model.addAttribute("house_arrest2", h2);
		model.addAttribute("house_arrest3", h3);

		// 이전 분기
		double[] bs1 = overallService.getBeforeScores1(adto);
		double[] bs2 = overallService.getBeforeScores2(adto);
		double[] bs3 = overallService.getBeforeScores3(adto);
		double[] bs4 = overallService.getBeforeScores4(adto);

		model.addAttribute("before_scores1", bs1);
		model.addAttribute("before_scores2", bs2);
		model.addAttribute("before_scores3", bs3);
		model.addAttribute("before_scores4", bs4);

		double bt1 = 0, bt2 = 0, bt3 = 0, bt4 = 0;
		for (int i = 0; i < bs1.length; i++) {
			bt1 += bs1[i];
			bt2 += bs2[i];
			bt3 += bs3[i];
			bt4 += bs4[i];
		}

		model.addAttribute("before_total1", Math.round(bt1 * 100) / 100.0);
		model.addAttribute("before_total2", Math.round(bt2 * 100) / 100.0);
		model.addAttribute("before_total3", Math.round(bt3 * 100) / 100.0);
		model.addAttribute("before_total4", Math.round(bt4 * 100) / 100.0);

		return "overallAnalysis.jsp";
	}
	
	@RequestMapping(value = "/getStoreData.do")
	public String getStoreList(AreaDTO adto, Model model, HttpSession session) throws Exception {
		System.out.println("StoreController 시작... service 호출");
		
		adto.setArea((String) session.getAttribute("area"));
		adto.setFood((String) session.getAttribute("food"));
		// select
		StoreDTO strFif = storeService.selectStrFif(adto);
		StoreDTO strFour = storeService.selectStrFour(adto);
		StoreDTO strThi = storeService.selectStrThi(adto);
		StoreDTO strSec = storeService.selectStrSec(adto);
		StoreDTO strFir = storeService.selectStrFir(adto);
		
		// update
		storeService.updateStrFif(strFif);
		storeService.updateStrFour(strFour);
		storeService.updateStrThi(strThi);
		storeService.updateStrSec(strSec);
		storeService.updateStrFir(strFir);
		
		// model add
		model.addAttribute("strFif", strFif);
		model.addAttribute("strFour", strFour);
		model.addAttribute("strThi", strThi);
		model.addAttribute("strSec", strSec);
		model.addAttribute("strFir", strFir);
		
		return "storelist.jsp";
		
	}
	
	// chart
	@RequestMapping(value = "/storechart.do", method = RequestMethod.POST)
	@ResponseBody
    public JSONObject getStoreChart() {
        return storeService.getChartData();
    }
	
	@RequestMapping(value = "/getSalesData.do")
	public String getSalesList(AreaDTO adto, Model model, HttpSession session) throws Exception {
		System.out.println("SalesController 시작... service 호출");
		adto.setArea((String) session.getAttribute("area"));
		adto.setFood((String) session.getAttribute("food"));
		// 총매출
		SalesDTO salesDtoFiv = salesService.selectSalesFiv(adto);
		SalesDTO salesDtoFou = salesService.selectSalesFou(adto);
		SalesDTO salesDtoThr = salesService.selectSalesThr(adto);
		SalesDTO salesDtoTwo = salesService.selectSalesTwo(adto);
		SalesDTO salesDtoOne = salesService.selectSalesOne(adto);
		
		// 매출 업뎃
		salesService.updatesalesFiv(salesDtoFiv);
		salesService.updatesalesFou(salesDtoFou);
		salesService.updatesalesThr(salesDtoThr);
		salesService.updatesalesTwo(salesDtoTwo);
		salesService.updatesalesOne(salesDtoOne);
		
		// 나머지 매출데이터
		SalesDTO salesData = salesService.selectSalesData(adto);
		
		// 주중,주말,요일 업뎃
		salesService.updatesalesDayMon(salesData);
		salesService.updatesalesDayTue(salesData);
		salesService.updatesalesDayWed(salesData);
		salesService.updatesalesDayThu(salesData);
		salesService.updatesalesDayFri(salesData);
		salesService.updatesalesDaySat(salesData);
		salesService.updatesalesDaySun(salesData);
		
		// 시간대별 업뎃
		salesService.updatesalesTimeFir(salesData);
		salesService.updatesalesTimeSec(salesData);
		salesService.updatesalesTimeThi(salesData);
		salesService.updatesalesTimeFou(salesData);
		salesService.updatesalesTimeFif(salesData);
		salesService.updatesalesTimeSix(salesData);
		
		// 연령별 업뎃
		salesService.updatesalesAgeM(salesData);
		salesService.updatesalesAgeFm(salesData);
		salesService.updatesalesAgeOne(salesData);
		salesService.updatesalesAgeTwo(salesData);
		salesService.updatesalesAgeThr(salesData);
		salesService.updatesalesAgeFor(salesData);
		salesService.updatesalesAgeFiv(salesData);
		salesService.updatesalesAgeSix(salesData);
		
		// 모델에 추가
		model.addAttribute("salesDtoFiv", salesDtoFiv);
		model.addAttribute("salesDtoFou", salesDtoFou);
		model.addAttribute("salesDtoThr", salesDtoThr);
		model.addAttribute("salesDtoTwo", salesDtoTwo);
		model.addAttribute("salesDtoOne", salesDtoOne);
		
		model.addAttribute("salesData", salesData);
		return "saleslist.jsp";
	}
	
	// 구글차트 데이터 넘기기
	@ResponseBody
	@RequestMapping(value = "/saleschart.do", method = RequestMethod.POST)
	public JSONObject getChart() {
		return salesService.getChartData();
	}
	
	

	// 인구분석
	@RequestMapping(value = "/getPopData.do")
	public String getPopData(AreaDTO adto, Model model, HttpSession session) {
		System.out.println("analysisControl => 인구 분석 페이지로 이동");
		adto.setArea((String) session.getAttribute("area"));
		adto.setFood((String) session.getAttribute("food"));
		adto.setSelect_year(2019);
		adto.setSelect_quarter(2);
		System.out.println(adto.getArea() + "//" + adto.getSelect_year() + "-" + adto.getSelect_quarter());
		model.addAttribute("q_floating", popService.getQuarter_FloatingPopData(adto));
		model.addAttribute("ga_floating", popService.getGenderAndAge_FloatingPopData(adto));
		model.addAttribute("t_floating", popService.getTime_FloatingPopData(adto));
		model.addAttribute("W_floating", popService.getWeekly_FloatingPopData(adto));
		model.addAttribute("residence", popService.getResidencePopData(adto));
		model.addAttribute("salleryMan", popService.getSalleryManPopData(adto));
		return "population.jsp";
	}

	// 인구분석-Ajax Method
	@RequestMapping(value = "/getSelectPopData.do", method = RequestMethod.POST)
	@ResponseBody
	public String getSelectPopData(AreaDTO adto, HttpSession session) {
		System.out.println("analysisControl => Ajax data 전송");
		adto.setArea((String) session.getAttribute("area"));
		System.out.println(adto.getArea() + "//" + adto.getSelect_year() + "-" + adto.getSelect_quarter() + "-"
				+ adto.getPopulation_type());
		if (adto.getPopulation_type().equals("GenderAndAge")) {
			GenderAndAge_FloatingPopDTO dto = popService.getGenderAndAge_FloatingPopData(adto);
			return dto.getTotal() + "|" + dto.getTotal_male() + "|" + dto.getTotal_female() + "|" + dto.getTotal_10()
					+ "|" + dto.getTotal_20() + "|" + dto.getTotal_30() + "|" + dto.getTotal_40() + "|"
					+ dto.getTotal_50() + "|" + dto.getTotal_60();
		} else if (adto.getPopulation_type().equals("TimeRange")) {
			Time_FloatingPopDTO dto = popService.getTime_FloatingPopData(adto);
			return dto.getTotal() + "|" + dto.getTotal_time1() + "|" + dto.getTotal_time2() + "|" + dto.getTotal_time3()
					+ "|" + dto.getTotal_time4() + "|" + dto.getTotal_time5() + "|" + dto.getTotal_time6();
		} else if (adto.getPopulation_type().equals("Week")) {
			Weekly_FloatingPopDTO dto = popService.getWeekly_FloatingPopData(adto);
			return dto.getTotal_weekend() + "|" + dto.getTotal_week() + "|" + dto.getTotal_sun() + "|"
					+ dto.getTotal_mon() + "|" + dto.getTotal_tue() + "|" + dto.getTotal_wed() + "|"
					+ dto.getTotal_thu() + "|" + dto.getTotal_fri() + "|" + dto.getTotal_sat();
		} else if (adto.getPopulation_type().equals("Residence")) {
			ResidencePopDTO dto = popService.getResidencePopData(adto);
			return dto.getTotal() + "|" + dto.getTotal_male() + "|" + dto.getTotal_female() + "|" + dto.getTotal_10()
					+ "|" + dto.getTotal_20() + "|" + dto.getTotal_30() + "|" + dto.getTotal_40() + "|"
					+ dto.getTotal_50() + "|" + dto.getTotal_60();
		} else if (adto.getPopulation_type().equals("SalleryMan")) {
			SalleryManPopDTO dto = popService.getSalleryManPopData(adto);
			return dto.getTotal() + "|" + dto.getTotal_male() + "|" + dto.getTotal_female() + "|" + dto.getTotal_10()
					+ "|" + dto.getTotal_20() + "|" + dto.getTotal_30() + "|" + dto.getTotal_40() + "|"
					+ dto.getTotal_50() + "|" + dto.getTotal_60();
		}
		return "undefined";
	}

	// 입지분석
	@RequestMapping(value = "/getIpjiData.do")
	public String getIpjiData(AreaDTO adto, Model model, HttpSession session) {

		adto.setArea((String) session.getAttribute("area"));
		System.out.println("populationControl => 입지분석 페이지로 이동");
		adto.setSelect_year(2019);
		adto.setSelect_quarter(2);
		model.addAttribute("MFD", localService.getMain_facilitesData(adto));
		model.addAttribute("GFM", localService.getGuest_facilitiesData(adto));
		model.addAttribute("TFD", localService.getTraffic_facilitiesData(adto));
		model.addAttribute("MFSD", localService.getMain_facilitiesStatusData(adto));
		model.addAttribute("SD", localService.getSchoolData(adto));
		model.addAttribute("FFAD", localService.getTraffic_facilities_analysis_Data(adto));
		model.addAttribute("FFAD2", localService.getTraffic_facilities_analysis_Data2(adto));
		model.addAttribute("SAD", localService.getSubway_analysis_Data(adto));
		model.addAttribute("RFAD", localService.getResidential_facility_analysis_Data(adto));
		model.addAttribute("RFAD2", localService.getResidential_facility_analysis_Data2(adto));
		model.addAttribute("APAD", localService.getApartment_analysis_Data(adto));
		model.addAttribute("AAD", localService.getArea_analysis_Data(adto));
		model.addAttribute("AAD2", localService.getArea_analysis_Data2(adto));
		model.addAttribute("PAD", localService.getPrice_analysis_Data(adto));
		model.addAttribute("PAD2", localService.getPrice_analysis_Data2(adto));
		return "ipjibunseuk.jsp";
	}

	@RequestMapping(value = "/getSelectedIpjiData.do", method = RequestMethod.POST)
	@ResponseBody
	public String getSelectedSchoolData(AreaDTO adto, HttpSession session) {
		System.out.println("populationControl => Ajax data 전송");
		adto.setArea((String) session.getAttribute("area"));
		System.out.println(adto.getArea() + "//" + adto.getSelect_year() + "-" + adto.getSelect_quarter() + "-"
				+ adto.getIpji_type());
		if (adto.getIpji_type().equals("School")) {
			Main_FacilitiesDTO dto = localService.getSchoolData(adto);
			return dto.getUniversity() + "|" + dto.getHighSchool() + "|" + dto.getMiddle_School() + "|"
					+ dto.getElementary_School() + "|" + dto.getKindergarden();
		} else if (adto.getIpji_type().equals("Apart")) {
			ApartmentDTO dto = localService.getResidential_facility_analysis_Data(adto);
			ApartmentDTO dto2 = localService.getResidential_facility_analysis_Data2(adto);
			return dto.getFamily_total() + "|" + dto.getApartment_total() + "|" + dto.getNon_apartment_total() + "|"
					+ dto2.getFamily_avg() + "|" + dto2.getApartment_Avg() + "|" + dto2.getNon_apartment_Avg();
		} else if (adto.getIpji_type().equals("Apart_family")) {
			ApartmentDTO dto3 = localService.getArea_analysis_Data(adto);
			ApartmentDTO dto4 = localService.getArea_analysis_Data2(adto);
			ApartmentDTO dto5 = localService.getPrice_analysis_Data(adto);
			ApartmentDTO dto6 = localService.getPrice_analysis_Data2(adto);
			return dto3.getArea_66_under_households() + "|" + dto3.getArea_66_households() + "|"
					+ dto3.getArea_99_households() + "|" + dto3.getArea_132_households() + "|"
					+ dto3.getArea_165_households() + "|" + dto3.getAvg_area() + "|" + dto4.getArea_66_under_Avg() + "|"
					+ dto4.getArea_66_Avg() + "|" + dto4.getArea_99_Avg() + "|" + dto4.getArea_132_Avg() + "|"
					+ dto4.getArea_165_Avg() + "|" + dto4.getApart_avg() + "|" + dto5.getPrice_1milion_under() + "|"
					+ dto5.getPrice_1milion() + "|" + dto5.getPrice_2milion() + "|" + dto5.getPrice_3milion() + "|"
					+ dto5.getPrice_4milion() + "|" + dto5.getPrice_5milion() + "|" + dto5.getPrice_6milion() + "|"
					+ dto5.getApart_Price_avg() + "|" + dto6.getPrice_1milion_under_Avg() + "|"
					+ dto6.getPrice_1milion_Avg() + "|" + dto6.getPrice_2milion_Avg() + "|"
					+ dto6.getPrice_3milion_Avg() + "|" + dto6.getPrice_4milion_Avg() + "|"
					+ dto6.getPrice_5milion_Avg() + "|" + dto6.getPrice_6milion_Avg() + "|" + dto6.getAvg_Price();

		}
		return "undefined";
	}

}
