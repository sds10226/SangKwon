package com.cafe24.sosang.service;

import java.util.List;

import com.cafe24.sosang.dto.ApartmentDTO;
import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.Main_FacilitiesDTO;

public interface LocalService {
	
	public List<ApartmentDTO> getApartment_analysis_Data(AreaDTO adto);
	public ApartmentDTO getArea_analysis_Data(AreaDTO adto);
	public ApartmentDTO getArea_analysis_Data2(AreaDTO adto);
	public ApartmentDTO getPrice_analysis_Data(AreaDTO adto);
	public ApartmentDTO getPrice_analysis_Data2(AreaDTO adto);
	public ApartmentDTO getResidential_facility_analysis_Data(AreaDTO adto);
	public ApartmentDTO getResidential_facility_analysis_Data2(AreaDTO adto);
	
	public List<Main_FacilitiesDTO> getMain_facilitesData(AreaDTO adto);
	public List<Main_FacilitiesDTO> getGuest_facilitiesData(AreaDTO adto);
	public List<Main_FacilitiesDTO> getTraffic_facilitiesData(AreaDTO adto);
	public List<Main_FacilitiesDTO> getMain_facilitiesStatusData(AreaDTO adto);
	public Main_FacilitiesDTO getSchoolData(AreaDTO adto);
	public Main_FacilitiesDTO getTraffic_facilities_analysis_Data(AreaDTO adto);
	public Main_FacilitiesDTO getTraffic_facilities_analysis_Data2(AreaDTO adto);
	public List<Main_FacilitiesDTO> getSubway_analysis_Data(AreaDTO adto);
}
