package com.cafe24.sosang.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.sosang.dto.AreaDTO;

@Repository
public class OverallDAOImpl implements OverallDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int getAllCnt(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getAllCnt", adto);
	}

	@Override
	public int getSelectCnt(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getSelectCnt", adto);
	}

	@Override
	public int getSales(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getSales", adto);
	}

	@Override
	public int getSalesCnt(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getSalesCnt", adto);
	}

	@Override
	public int getResPop(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getResPop", adto);
	}

	@Override
	public int getSalPop(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getSalPop", adto);
	}

	@Override
	public int getFloPop(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getFloPop", adto);
	}

	@Override
	public int getFacilCnt(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getFacilCnt", adto);
	}

	@Override
	public int getSchoolCnt(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getSchoolCnt", adto);
	}

	@Override
	public int getTrafficCnt(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getTrafficCnt", adto);
	}

	@Override
	public double getGrowth1Condition(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getGrowth1Condition", adto);
	}

	@Override
	public double getGrowth2Condition(AreaDTO adto) {
		return sqlSessionTemplate.selectOne("overallDAOmap.getGrowth2Condition", adto);
	}

	@Override
	public double[] getGrowth3Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getGrowth3Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getGrowth3Condition2", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getGrowth3Condition3", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getGrowth3Condition4", adto)				
		};
		return vals;
	}

	@Override
	public double[] getGrowth4Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getGrowth4Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getGrowth4Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getStability1Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getStability1Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getStability1Condition2", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getStability1Condition3", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getStability1Condition4", adto)				
		};
		return vals;
	}

	@Override
	public double[] getStability2Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getStability2Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getStability2Condition2", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getStability2Condition3", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getStability2Condition4", adto)				
		};
		return vals;
	}

	@Override
	public double[] getStability3Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getStability3Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getStability3Condition2", adto)			
		};
		return vals;
	}

	@Override
	public double[] getStability4Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getStability4Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getStability4Condition2", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getStability4Condition3", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getStability4Condition4", adto)				
		};
		return vals;
	}

	@Override
	public double[] getBusinessAbility1Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility1Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility1Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getBusinessAbility2Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility2Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility2Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getBusinessAbility3Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility3Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility3Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getBusinessAbility4Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility4Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility4Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getBusinessAbility5Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility5Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility5Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getBusinessAbility6Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility6Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getBusinessAbility6Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getPurchasingPower1Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getPurchasingPower1Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getPurchasingPower1Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getPurchasingPower2Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getPurchasingPower2Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getPurchasingPower2Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getPurchasingPower3Conditions(AreaDTO adto) {
		double[] vals=null;
		try {
			vals=new double[]{
					sqlSessionTemplate.selectOne("overallDAOmap.getPurchasingPower3Condition1", adto),
					sqlSessionTemplate.selectOne("overallDAOmap.getPurchasingPower3Condition2", adto)				
			};
		} catch (NullPointerException e) {
			vals = new double[]{0,0};
		}
		return vals;
	}

	@Override
	public double[] getHouseArrest1Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getHouseArrest1Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getHouseArrest1Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getHouseArrest2Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getHouseArrest2Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getHouseArrest2Condition2", adto)				
		};
		return vals;
	}

	@Override
	public double[] getHouseArrest3Conditions(AreaDTO adto) {
		double[] vals = {
				sqlSessionTemplate.selectOne("overallDAOmap.getHouseArrest3Condition1", adto),
				sqlSessionTemplate.selectOne("overallDAOmap.getHouseArrest3Condition2", adto)				
		};
		return vals;
	}

}
