package com.cafe24.sosang.dao;

import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.GenderAndAge_FloatingPopDTO;
import com.cafe24.sosang.dto.Quarter_FloatingPopDTO;
import com.cafe24.sosang.dto.ResidencePopDTO;
import com.cafe24.sosang.dto.SalleryManPopDTO;
import com.cafe24.sosang.dto.Time_FloatingPopDTO;
import com.cafe24.sosang.dto.Weekly_FloatingPopDTO;

public interface PopDAO {
	public Quarter_FloatingPopDTO getQuarter_FloatingPopData(AreaDTO adto);

	public GenderAndAge_FloatingPopDTO getGenderAndAge_FloatingPopData(AreaDTO adto);

	public Time_FloatingPopDTO getTime_FloatingPopData(AreaDTO adto);

	public Weekly_FloatingPopDTO getWeekly_FloatingPopData(AreaDTO adto);

	public ResidencePopDTO getResidencePopData(AreaDTO adto);

	public SalleryManPopDTO getSalleryManPopData(AreaDTO adto);
}
