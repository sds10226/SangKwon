package com.cafe24.sosang.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.ResultDTO;
import com.cafe24.sosang.dto.StoreDTO;



@Repository("storeDAO")
public class StoreDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.store.mappers.store";
	StoreDTO sdto = null;

	// select
	public StoreDTO selectStrFif(AreaDTO adto) {
		System.out.println("StoreDAO selectStrFif() ... mapper 호출");
		try {
			sdto = sql.selectOne(namespace + ".selectStrFif", adto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mapper... dto 반환");
		return sdto;
	}
	public StoreDTO selectStrFour(AreaDTO adto) {
		System.out.println("StoreDAO selectStrFour() ... mapper 호출");
		try {
			sdto = sql.selectOne(namespace + ".selectStrFour", adto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mapper... dto 반환");
		return sdto;
	}
	public StoreDTO selectStrThi(AreaDTO adto) {
		System.out.println("StoreDAO selectStrThi() ... mapper 호출");
		try {
			sdto = sql.selectOne(namespace + ".selectStrThi", adto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mapper... dto 반환");
		return sdto;
	}
	public StoreDTO selectStrSec(AreaDTO adto) {
		System.out.println("StoreDAO selectStrSec() ... mapper 호출");
		try {
			sdto = sql.selectOne(namespace + ".selectStrSec", adto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mapper... dto 반환");
		return sdto;
	}
	public StoreDTO selectStrFir(AreaDTO adto) {
		System.out.println("StoreDAO selectStrFir() ... mapper 호출");
		try {
			sdto = sql.selectOne(namespace + ".selectStrFir", adto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mapper... dto 반환");
		return sdto;
	}
	
	// update
	public void updateStrFif(StoreDTO dto) {
		System.out.println("StoreDAO updateStrFif() ... mapper 호출");
		System.out.println(dto.toString());
		try {
			sql.update(namespace + ".updateStrFif", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateStrFour(StoreDTO dto) {
		System.out.println("StoreDAO updateStrFour() ... mapper 호출");
		try {
			sql.update(namespace + ".updateStrFour", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateStrThi(StoreDTO dto) {
		System.out.println("StoreDAO updateStrThi() ... mapper 호출");
		try {
			sql.update(namespace + ".updateStrThi", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateStrSec(StoreDTO dto) {
		System.out.println("StoreDAO updateStrSec() ... mapper 호출");
		try {
			sql.update(namespace + ".updateStrSec", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateStrFir(StoreDTO dto) {
		System.out.println("StoreDAO updateStrFir() ... mapper 호출");
		try {
			sql.update(namespace + ".updateStrFir", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// update후 select -> chart 데이터
	public List<ResultDTO> selectStrList() {
		System.out.println("StoreDAO selectStrList() ... mapper 호출");
		List<ResultDTO> strList = null;
		try {
			strList = sql.selectList(namespace + ".selectStrList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mapper... list 반환");
		return strList;
	}

}
