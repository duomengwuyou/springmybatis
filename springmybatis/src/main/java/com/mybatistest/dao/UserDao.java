package com.mybatistest.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mybatistest.entity.User;

@Repository
public interface UserDao {

	//获取总数量
	int getRowCount();

	//分页获取用户信息
	List<User> selectByParams(Map<String, Object> params);
}
