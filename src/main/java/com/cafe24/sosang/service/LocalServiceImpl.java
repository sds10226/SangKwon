package com.cafe24.sosang.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.sosang.dao.LocalDAO;
import com.cafe24.sosang.dto.ApartmentDTO;
import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.Main_FacilitiesDTO;



@Service("LocalService")
public class LocalServiceImpl implements LocalService{

	@Autowired
	private LocalDAO sosangDAO;

	
	
	@Override
	public List<ApartmentDTO> getApartment_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getApartment_analysis_Data 실행 ");
		return sosangDAO.getApartment_analysis_Data(adto);
	}

	@Override
	public ApartmentDTO getArea_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getArea_analysis_Data 실행 ");
		return sosangDAO.getArea_analysis_Data(adto);
	}
	@Override
	public ApartmentDTO getArea_analysis_Data2(AreaDTO adto) {
		System.out.println("===>JDBC로 getArea_analysis_Data2 실행 ");
		return sosangDAO.getArea_analysis_Data2(adto);
	}
	@Override
	public ApartmentDTO getPrice_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getPrice_analysis_Data 실행 ");
		return sosangDAO.getPrice_analysis_Data(adto);
	}
	@Override
	public ApartmentDTO getPrice_analysis_Data2(AreaDTO adto) {
		System.out.println("===>JDBC로 getPrice_analysis_Data2 실행 ");
		return sosangDAO.getPrice_analysis_Data2(adto);
	}
	@Override
	public List<Main_FacilitiesDTO> getMain_facilitesData(AreaDTO adto) {
		System.out.println("===>JDBC로 getMain_facilitesData 실행 ");
		return sosangDAO.getMain_facilitesData(adto);
	}

	@Override
	public List<Main_FacilitiesDTO> getGuest_facilitiesData(AreaDTO adto) {
		System.out.println("===>JDBC로 getGuest_facilitiesData 실행 ");
		return sosangDAO.getGuest_facilitiesData(adto);
	}

	@Override
	public List<Main_FacilitiesDTO> getTraffic_facilitiesData(AreaDTO adto) {
		System.out.println("===>JDBC로 getTraffic_facilitiesData 실행 ");
		return sosangDAO.getTraffic_facilitiesData(adto);
	}

	@Override
	public List<Main_FacilitiesDTO> getMain_facilitiesStatusData(AreaDTO adto) {
		System.out.println("===>JDBC로 getMain_facilitiesStatusData 실행 ");
		return sosangDAO.getMain_facilitiesStatusData(adto);

	}

	@Override
	public Main_FacilitiesDTO getSchoolData(AreaDTO adto) {
		System.out.println("===>JDBC로 getSchoolData 실행 ");
		return sosangDAO.getSchoolData(adto);

	}

	@Override
	public Main_FacilitiesDTO getTraffic_facilities_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getTraffic_facilities_analysis_Data 실행 ");
		return sosangDAO.getTraffic_facilities_analysis_Data(adto);

	}

	@Override
	public List<Main_FacilitiesDTO> getSubway_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getSubway_analysis_Data 실행 ");
		return sosangDAO.getSubway_analysis_Data(adto);

	}

	@Override
	public ApartmentDTO getResidential_facility_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getResidential_facility_analysis_Data 실행 ");
		return sosangDAO.getResidential_facility_analysis_Data(adto);

	}

	@Override
	public ApartmentDTO getResidential_facility_analysis_Data2(AreaDTO adto) {
		System.out.println("===>JDBC로 getResidential_facility_analysis_Data2 실행 ");
		return sosangDAO.getResidential_facility_analysis_Data2(adto);
	}

	@Override
	public Main_FacilitiesDTO getTraffic_facilities_analysis_Data2(AreaDTO adto) {
		System.out.println("===>JDBC로 getTraffic_facilities_analysis_Data2 실행 ");
		return sosangDAO.getTraffic_facilities_analysis_Data2(adto);

	}



}
