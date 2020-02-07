package com.cafe24.sosang.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.sosang.dto.ApartmentDTO;
import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.Main_FacilitiesDTO;




@Repository
public class LocalDAOImpl implements LocalDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ApartmentDTO> getApartment_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getApartment_analysis_Data 실행 ");
		return sqlSessionTemplate.selectList("localDAOmap.getApartment_analysis_Data",adto);
	}
	
	@Override
	public ApartmentDTO getResidential_facility_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getResidential_facility_analysis_Data 실행 ");
		return sqlSessionTemplate.selectOne("localDAOmap.getResidential_facility_analysis_Data",adto);
	}

	@Override
	public ApartmentDTO getArea_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getArea_analysis_Data 실행 ");
		System.out.println(adto.toString());
		return sqlSessionTemplate.selectOne("localDAOmap.getArea_analysis_Data",adto);
	}
	@Override
	public ApartmentDTO getArea_analysis_Data2(AreaDTO adto) {
		System.out.println("===>JDBC로 getArea_analysis_Data2 실행 ");
		return sqlSessionTemplate.selectOne("localDAOmap.getArea_analysis_Data2",adto);
	}
	@Override
	public ApartmentDTO getPrice_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getPrice_analysis_Data 실행 ");
		return sqlSessionTemplate.selectOne("localDAOmap.getPrice_analysis_Data",adto);
	}
	@Override
	public ApartmentDTO getPrice_analysis_Data2(AreaDTO adto) {
		System.out.println("===>JDBC로 getPrice_analysis_Data2 실행 ");
		return sqlSessionTemplate.selectOne("localDAOmap.getPrice_analysis_Data2",adto);
	}
	@Override
	public List<Main_FacilitiesDTO> getMain_facilitesData(AreaDTO adto) {
		System.out.println("===>JDBC로 getMain_facilitesData 실행 ");
		return sqlSessionTemplate.selectList("localDAOmap.getMain_facilitesData",adto);
	}

	@Override
	public List<Main_FacilitiesDTO> getGuest_facilitiesData(AreaDTO adto) {
		System.out.println("===>JDBC로 getGuest_facilitiesData 실행 ");
		return sqlSessionTemplate.selectList("localDAOmap.getGuest_facilitiesData",adto);
	}

	@Override
	public List<Main_FacilitiesDTO> getTraffic_facilitiesData(AreaDTO adto) {
		System.out.println("===>JDBC로 getTraffic_facilitiesData 실행 ");
		return sqlSessionTemplate.selectList("localDAOmap.getTraffic_facilitiesData",adto);
	}

	@Override
	public List<Main_FacilitiesDTO> getMain_facilitiesStatusData(AreaDTO adto) {
		System.out.println("===>JDBC로 getMain_facilitiesStatusData 실행 ");
		return sqlSessionTemplate.selectList("localDAOmap.getMain_facilitiesStatusData",adto);

	}

	@Override
	public Main_FacilitiesDTO getSchoolData(AreaDTO adto) {
		System.out.println("===>JDBC로 getSchoolData 실행 ");
		return sqlSessionTemplate.selectOne("localDAOmap.getSchoolData",adto);

	}

	@Override
	public Main_FacilitiesDTO getTraffic_facilities_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getTraffic_facilities_analysis_Data 실행 ");
		return sqlSessionTemplate.selectOne("localDAOmap.getTraffic_facilities_analysis_Data",adto);

	}

	@Override
	public List<Main_FacilitiesDTO> getSubway_analysis_Data(AreaDTO adto) {
		System.out.println("===>JDBC로 getSubway_analysis_Data 실행 ");
		return sqlSessionTemplate.selectList("localDAOmap.getSubway_analysis_Data",adto);

	}

	@Override
	public ApartmentDTO getResidential_facility_analysis_Data2(AreaDTO adto) {
		System.out.println("===>JDBC로 getResidential_facility_analysis_Data2 실행 ");
		return sqlSessionTemplate.selectOne("localDAOmap.getResidential_facility_analysis_Data2",adto);
	}

	@Override
	public Main_FacilitiesDTO getTraffic_facilities_analysis_Data2(AreaDTO adto) {
		System.out.println("===>JDBC로 getTraffic_facilities_analysis_Data2 실행 ");
		return sqlSessionTemplate.selectOne("localDAOmap.getTraffic_facilities_analysis_Data2",adto);

	}



	
}
