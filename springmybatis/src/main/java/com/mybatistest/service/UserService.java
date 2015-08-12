package com.mybatistest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mybatistest.dao.UserDao;
import com.mybatistest.entity.User;
import com.mybatistest.util.PageParam;

@Service
public class UserService {

	@Resource
	UserDao dao ;
	
	public int getRowCount() {
		return dao.getRowCount();
	}

	public PageParam getUserListByPage(PageParam pageParam) {
		int currPage = pageParam.getCurrPage();
		// limit offset, size
		int offset = (currPage - 1) * PageParam.pageSize ;
		if(offset < 0){
			offset = 0;
		}
		int size = PageParam.pageSize;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("size", size);
		
		List<User> users = dao.selectByParams(params);
		pageParam.setData(users);
		
		return pageParam;
	}

}

