package com.cafe24.sosang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.sosang.dao.PopDAO;
import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.GenderAndAge_FloatingPopDTO;
import com.cafe24.sosang.dto.Quarter_FloatingPopDTO;
import com.cafe24.sosang.dto.ResidencePopDTO;
import com.cafe24.sosang.dto.SalleryManPopDTO;
import com.cafe24.sosang.dto.Time_FloatingPopDTO;
import com.cafe24.sosang.dto.Weekly_FloatingPopDTO;

@Service("popService")
public class PopServiceImpl implements PopService {
	
	@Autowired
	private PopDAO popDAO;

	@Override
	public Quarter_FloatingPopDTO getQuarter_FloatingPopData(AreaDTO adto) {
		return popDAO.getQuarter_FloatingPopData(adto);
	}

	@Override
	public GenderAndAge_FloatingPopDTO getGenderAndAge_FloatingPopData(AreaDTO adto) {
		return popDAO.getGenderAndAge_FloatingPopData(adto);
	}

	@Override
	public Time_FloatingPopDTO getTime_FloatingPopData(AreaDTO adto) {
		return popDAO.getTime_FloatingPopData(adto);
	}

	@Override
	public Weekly_FloatingPopDTO getWeekly_FloatingPopData(AreaDTO adto) {
		return popDAO.getWeekly_FloatingPopData(adto);
	}

	@Override
	public ResidencePopDTO getResidencePopData(AreaDTO adto) {
		return popDAO.getResidencePopData(adto);
	}

	@Override
	public SalleryManPopDTO getSalleryManPopData(AreaDTO adto) {
		return popDAO.getSalleryManPopData(adto);
	}

}
