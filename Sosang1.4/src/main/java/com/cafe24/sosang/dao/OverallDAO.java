package com.cafe24.sosang.dao;

import com.cafe24.sosang.dto.AreaDTO;

public interface OverallDAO {

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

	public double getGrowth1Condition(AreaDTO adto);
	public double getGrowth2Condition(AreaDTO adto);
	public double[] getGrowth3Conditions(AreaDTO adto);
	public double[] getGrowth4Conditions(AreaDTO adto);

	public double[] getStability1Conditions(AreaDTO adto);
	public double[] getStability2Conditions(AreaDTO adto);
	public double[] getStability3Conditions(AreaDTO adto);
	public double[] getStability4Conditions(AreaDTO adto);

	public double[] getBusinessAbility1Conditions(AreaDTO adto);
	public double[] getBusinessAbility2Conditions(AreaDTO adto);
	public double[] getBusinessAbility3Conditions(AreaDTO adto);
	public double[] getBusinessAbility4Conditions(AreaDTO adto);
	public double[] getBusinessAbility5Conditions(AreaDTO adto);
	public double[] getBusinessAbility6Conditions(AreaDTO adto);

	public double[] getPurchasingPower1Conditions(AreaDTO adto);
	public double[] getPurchasingPower2Conditions(AreaDTO adto);
	public double[] getPurchasingPower3Conditions(AreaDTO adto);

	public double[] getHouseArrest1Conditions(AreaDTO adto);
	public double[] getHouseArrest2Conditions(AreaDTO adto);
	public double[] getHouseArrest3Conditions(AreaDTO adto);

}
