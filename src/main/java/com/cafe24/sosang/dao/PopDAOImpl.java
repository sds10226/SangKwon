package com.cafe24.sosang.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.GenderAndAge_FloatingPopDTO;
import com.cafe24.sosang.dto.Quarter_FloatingPopDTO;
import com.cafe24.sosang.dto.ResidencePopDTO;
import com.cafe24.sosang.dto.SalleryManPopDTO;
import com.cafe24.sosang.dto.Time_FloatingPopDTO;
import com.cafe24.sosang.dto.Weekly_FloatingPopDTO;

@Repository
public class PopDAOImpl implements PopDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Quarter_FloatingPopDTO getQuarter_FloatingPopData(AreaDTO adto) {
		System.out.println("====> JDBC로 getQuarter_FloatingPopData 실행");
		return sqlSessionTemplate.selectOne("popDAOmap.getQuarter_FloatingData", adto);
	}

	public GenderAndAge_FloatingPopDTO getGenderAndAge_FloatingPopData(AreaDTO adto) {
		System.out.println("====> JDBC로 getGenderAndAge_FloatingPopData 실행");
		return sqlSessionTemplate.selectOne("popDAOmap.getGenderAndAge_FloatingData", adto);
	}

	public Time_FloatingPopDTO getTime_FloatingPopData(AreaDTO adto) {
		System.out.println("====> JDBC로 getTime_FloatingPopData 실행");
		return sqlSessionTemplate.selectOne("popDAOmap.getTime_FloatingData", adto);
	}

	public Weekly_FloatingPopDTO getWeekly_FloatingPopData(AreaDTO adto) {
		System.out.println("====> JDBC로 getWeekly_FloatingPopData 실행");
		return sqlSessionTemplate.selectOne("popDAOmap.getWeekly_FloatingData", adto);
	}

	public ResidencePopDTO getResidencePopData(AreaDTO adto) {
		System.out.println("====> JDBC로 getResidencePopData 실행");
		return sqlSessionTemplate.selectOne("popDAOmap.getResidenceData", adto);
	}

	public SalleryManPopDTO getSalleryManPopData(AreaDTO adto) {
		System.out.println("====> JDBC로 getSalleryManPopData 실행");
		return sqlSessionTemplate.selectOne("popDAOmap.getSalleryManData", adto);
	}
}
