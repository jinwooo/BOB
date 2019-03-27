package com.bob.proj.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bob.proj.model.dao.BobManagerDao;
import com.bob.proj.model.dto.BobManagerDto;

@Service
public class BobManagerBizImpl implements BobManagerBiz {

	@Autowired
	private BobManagerDao dao;

	@Override
	public List<BobManagerDto> selectList(String user_id, String bm_date) {
		return dao.selectList(user_id, bm_date);
	}

	@Override
	public int bminsert(BobManagerDto dto) {
		return dao.bminsert(dto);
	}
	

}
