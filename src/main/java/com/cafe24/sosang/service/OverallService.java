package com.cafe24.sosang.service;

import com.cafe24.sosang.dto.AreaDTO;

public interface OverallService {

	public int getAllCnt(AreaDTO adto);
	public int getSelectCnt(AreaDTO adto);
	public int getSales(AreaDTO adto);
	public int getSalesCnt(AreaDTO adto);
	public int getResPop(AreaDTO adto);
	public int getSalPop(AreaDTO adto);
	public int getFloPop(AreaDTO adto);
	public int getFacilCnt(AreaDTO adto);
	public int getSchoolCnt(AreaDTO adto);
	public int getTrafficCnt(AreaDTO adto);
	

	public double getGrowth1(AreaDTO adto);
	public double getGrowth2(AreaDTO adto);
	public double getGrowth3(AreaDTO adto);
	public double getGrowth4(AreaDTO adto);
	

	public double getStability1(AreaDTO adto);
	public double getStability2(AreaDTO adto);
	public double getStability3(AreaDTO adto);
	public double getStability4(AreaDTO adto);
	

	public double getBusinessAbility1(AreaDTO adto);
	public double getBusinessAbility2(AreaDTO adto);
	public double getBusinessAbility3(AreaDTO adto);
	public double getBusinessAbility4(AreaDTO adto);
	public double getBusinessAbility5(AreaDTO adto);
	public double getBusinessAbility6(AreaDTO adto);
	

	public double getPurchasingPower1(AreaDTO adto);
	public double getPurchasingPower2(AreaDTO adto);
	public double getPurchasingPower3(AreaDTO adto);
	

	public double getHouseArrest1(AreaDTO adto);
	public double getHouseArrest2(AreaDTO adto);
	public double getHouseArrest3(AreaDTO adto);

	public double[] getBeforeScores1(AreaDTO adto);
	public double[] getBeforeScores2(AreaDTO adto);
	public double[] getBeforeScores3(AreaDTO adto);
	public double[] getBeforeScores4(AreaDTO adto);
}
