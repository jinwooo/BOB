package com.bob.proj.model.biz;

import java.util.List;

import com.bob.proj.model.dto.BobManagerDto;

public interface BobManagerBiz {

	public List<BobManagerDto> selectList(String user_id, String bm_date);
	
}
