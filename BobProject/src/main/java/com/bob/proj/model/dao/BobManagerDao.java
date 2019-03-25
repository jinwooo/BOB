package com.bob.proj.model.dao;

import java.util.List;

import com.bob.proj.model.dto.BobManagerDto;

public interface BobManagerDao {

	String NAMESPACE = "bobmanager.";
	
	public List<BobManagerDto> selectList(String user_id, String bm_date);
	

}
