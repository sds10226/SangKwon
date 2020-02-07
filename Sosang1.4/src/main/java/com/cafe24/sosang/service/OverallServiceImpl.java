package com.cafe24.sosang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.sosang.dao.OverallDAO;
import com.cafe24.sosang.dto.AreaDTO;

@Service("overallService")
public class OverallServiceImpl implements OverallService {
	
	@Autowired
	private OverallDAO overallDAO;
	
	@Override
	public int getAllCnt(AreaDTO adto) {
		return overallDAO.getAllCnt(adto);
	}

	@Override
	public int getSelectCnt(AreaDTO adto) {
		return overallDAO.getSelectCnt(adto);
	}

	@Override
	public int getSales(AreaDTO adto) {
		return overallDAO.getSales(adto);
	}

	@Override
	public int getSalesCnt(AreaDTO adto) {
		return overallDAO.getSalesCnt(adto);
	}

	@Override
	public int getResPop(AreaDTO adto) {
		return overallDAO.getResPop(adto);
	}

	@Override
	public int getSalPop(AreaDTO adto) {
		return overallDAO.getSalPop(adto);
	}

	@Override
	public int getFloPop(AreaDTO adto) {
		return overallDAO.getFloPop(adto);
	}

	@Override
	public int getFacilCnt(AreaDTO adto) {
		return overallDAO.getFacilCnt(adto);
	}

	@Override
	public int getSchoolCnt(AreaDTO adto) {
		return overallDAO.getSchoolCnt(adto);
	}

	@Override
	public int getTrafficCnt(AreaDTO adto) {
		return overallDAO.getTrafficCnt(adto);
	}

	private double checkScore(double score, double max) {
		if(score < 0) {
			score = 0;
		}
		if(score > max) {
			score = max;
		}
		return score;
	}
	
	@Override
	public double getGrowth1(AreaDTO adto) {
		double score = 2.5;
		double val;
		val = overallDAO.getGrowth1Condition(adto);
		score += Math.round(val)/10.0;
		
		return checkScore(score, 5.0);
	}

	@Override
	public double getGrowth2(AreaDTO adto) {
		double score = 2.5;
		double val;
		
		val = overallDAO.getGrowth2Condition(adto);
		score += Math.round(val)/10.0;
		
		return checkScore(score, 5.0);
	}

	@Override
	public double getGrowth3(AreaDTO adto) {
		double score = 2.5;
		double[] vals = overallDAO.getGrowth3Conditions(adto);
		double curVal, preVal, result;
		
		curVal = vals[0]/vals[1]*100;
		preVal = vals[2]/vals[3]*100;
		result = (curVal - preVal)/preVal * 100;
		
		score += Math.round(result)/10.0;
		
		return checkScore(score, 5.0);
	}

	@Override
	public double getGrowth4(AreaDTO adto) {
		double score = 2.5;
		double[] vals = overallDAO.getGrowth4Conditions(adto);
		double result;
		
		result = (vals[0] + vals[1])/2.0;
		score += Math.round(result)/10.0;
		
		return checkScore(score, 5.0);
	}

	@Override
	public double getStability1(AreaDTO adto) {
		double score = 5.0;
		double[] vals = overallDAO.getStability1Conditions(adto);
		double result;
		
		result = (vals[0] + vals[1] + vals[2] + vals[3])/4.0;
		score -= Math.round(result*2.0)/10.0;
		
		return checkScore(score, 5.0);
	}

	@Override
	public double getStability2(AreaDTO adto) {
		double score = 5.0;
		double[] vals = overallDAO.getStability2Conditions(adto);
		double result;
		
		result = (vals[0] + vals[1] + vals[2] + vals[3])/4.0;
		score -= Math.round(result*2.0)/10.0;
		
		return checkScore(score, 5.0);
	}

	@Override
	public double getStability3(AreaDTO adto) {
		double score = 0.0;
		double[] vals = overallDAO.getStability3Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score += Math.round(result*2.5*10)/10.0;
		
		return checkScore(score, 5.0);
	}

	@Override
	public double getStability4(AreaDTO adto) {
		double score = 5.0;
		double[] vals = overallDAO.getStability4Conditions(adto);
		double result;
		
		result = (vals[0] + vals[1] + vals[2] + vals[3])/4.0;
		score -= Math.round(result*2.0)/10.0;

		return checkScore(score, 5.0);
	}

	@Override
	public double getBusinessAbility1(AreaDTO adto) {
		double score = 0.0;
		double[] vals = overallDAO.getBusinessAbility1Conditions(adto);
		double result;
		
		result = vals[0] / vals[1] * 100;
		score += Math.round(result*2.5*10)/10.0;

		return checkScore(score, 5.0);
	}

	@Override
	public double getBusinessAbility2(AreaDTO adto) {
		double score = 0.0;
		double[] vals = overallDAO.getBusinessAbility2Conditions(adto);
		double result;
		
		result = vals[0] / vals[1] * 100;
		score += Math.round(result*2.5*10)/10.0;

		return checkScore(score, 5.0);
	}

	@Override
	public double getBusinessAbility3(AreaDTO adto) {
		double score = 5.0;
		double[] vals = overallDAO.getBusinessAbility3Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score -= Math.round(result*2.0*10)/10.0;

		return checkScore(score, 5.0);
	}

	@Override
	public double getBusinessAbility4(AreaDTO adto) {
		double score = 2.0;
		double[] vals = overallDAO.getBusinessAbility4Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score -= Math.round(result*0.8*10)/10.0;

		return checkScore(score, 2.0);
	}

	@Override
	public double getBusinessAbility5(AreaDTO adto) {
		double score = 1.5;
		double[] vals = overallDAO.getBusinessAbility5Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score -= Math.round(result*0.6*10)/10.0;

		return checkScore(score, 1.5);
	}

	@Override
	public double getBusinessAbility6(AreaDTO adto) {
		double score = 1.5;
		double[] vals = overallDAO.getBusinessAbility6Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score -= Math.round(result*0.6*10)/10.0;

		return checkScore(score, 1.5);
	}

	@Override
	public double getPurchasingPower1(AreaDTO adto) {
		double score = 0.0;
		double[] vals = overallDAO.getPurchasingPower1Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score += Math.round(result*3.0*10)/10.0;

		return checkScore(score, 7.5);
	}

	@Override
	public double getPurchasingPower2(AreaDTO adto) {
		double score = 0.0;
		double[] vals = overallDAO.getPurchasingPower2Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score += Math.round(result*3.0*10)/10.0;

		return checkScore(score, 7.5);
	}

	@Override
	public double getPurchasingPower3(AreaDTO adto) {
		double score = 0.0;
		double[] vals = overallDAO.getPurchasingPower3Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score += Math.round(result*2.0*10)/10.0;

		return checkScore(score, 5.0);
	}

	@Override
	public double getHouseArrest1(AreaDTO adto) {
		double score = 0.0;
		double[] vals = overallDAO.getHouseArrest1Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score += Math.round(result*4.0*10)/10.0;

		return checkScore(score, 10.0);
	}

	@Override
	public double getHouseArrest2(AreaDTO adto) {
		double score = 0.0;
		double[] vals = overallDAO.getHouseArrest2Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score += Math.round(result*2.0*10)/10.0;

		return checkScore(score, 5.0);
	}

	@Override
	public double getHouseArrest3(AreaDTO adto) {
		double score = 0.0;
		double[] vals = overallDAO.getHouseArrest3Conditions(adto);
		double result;
		
		result = vals[0] / vals[1];
		score += Math.round(result*2.0*10)/10.0;

		return checkScore(score, 5.0);
	}
	
	public double[] getTotals(AreaDTO adto) {
		double gtot = 
			getGrowth1(adto)
			+getGrowth2(adto)
			+getGrowth3(adto)
			+getGrowth4(adto);
		double stot =
			getStability1(adto)
			+getStability2(adto)
			+getStability3(adto)
			+getStability4(adto);
		double btot = 
			getBusinessAbility1(adto)
			+getBusinessAbility2(adto)
			+getBusinessAbility3(adto)
			+getBusinessAbility4(adto)
			+getBusinessAbility5(adto)
			+getBusinessAbility6(adto);
		double ptot = 
			getPurchasingPower1(adto)
			+getPurchasingPower2(adto)
			+getPurchasingPower3(adto);
		double htot = 
			getHouseArrest1(adto)
			+getHouseArrest2(adto)
			+getHouseArrest3(adto);
		
		double[] totals = {
				Math.round(gtot*100)/100.0,
				Math.round(stot*100)/100.0,
				Math.round(btot*100)/100.0,
				Math.round(ptot*100)/100.0,
				Math.round(htot*100)/100.0
		};
		
		return totals;
	}

	@Override
	public double[] getBeforeScores1(AreaDTO adto) {
		AreaDTO dto = new AreaDTO();
		int year, quarter;
		if(adto.getSelect_quarter() < 2) {
			year = adto.getSelect_year()-1;
			quarter = adto.getSelect_quarter()+3;
		}
		else {
			year = adto.getSelect_year();
			quarter = adto.getSelect_quarter()-1;
		}
		dto.setSelect_year(year);
		dto.setSelect_quarter(quarter);
		dto.setArea(adto.getArea());
		dto.setFood(adto.getFood());
		return getTotals(dto);
	}

	@Override
	public double[] getBeforeScores2(AreaDTO adto) {
		AreaDTO dto = new AreaDTO();
		int year, quarter;
		if(adto.getSelect_quarter() < 3) {
			year = adto.getSelect_year()-1;
			quarter = adto.getSelect_quarter()+2;
		}
		else {
			year = adto.getSelect_year();
			quarter = adto.getSelect_quarter()-2;
		}
		dto.setSelect_year(year);
		dto.setSelect_quarter(quarter);
		dto.setArea(adto.getArea());
		dto.setFood(adto.getFood());
		return getTotals(dto);
	}

	@Override
	public double[] getBeforeScores3(AreaDTO adto) {
		AreaDTO dto = new AreaDTO();
		int year, quarter;
		if(adto.getSelect_quarter() < 4) {
			year = adto.getSelect_year()-1;
			quarter = adto.getSelect_quarter()+1;
		}
		else {
			year = adto.getSelect_year();
			quarter = adto.getSelect_quarter()-3;
		}
		dto.setSelect_year(year);
		dto.setSelect_quarter(quarter);
		dto.setArea(adto.getArea());
		dto.setFood(adto.getFood());
		return getTotals(dto);
	}

	@Override
	public double[] getBeforeScores4(AreaDTO adto) {
		AreaDTO dto = new AreaDTO();
		int year, quarter;
		year = adto.getSelect_year()-1;
		quarter = adto.getSelect_quarter();
		dto.setSelect_year(year);
		dto.setSelect_quarter(quarter);
		dto.setArea(adto.getArea());
		dto.setFood(adto.getFood());
		return getTotals(dto);
	}
}
