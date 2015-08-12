package com.mybatistest.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mybatistest.service.UserService;
import com.mybatistest.util.PageParam;

@Controller
public class IndexController {

	@Resource
	UserService service;
	
	@RequestMapping(value = "index")
	public String helloWorld(HttpServletRequest request){
		String currPageStr = request.getParameter("page");
		int currPage = 1;
		try {
			currPage = Integer.parseInt(currPageStr);
			if(currPage == 0){
				currPage = 1;
			}
		} catch (Exception e) {
		}
		//分页获取数据
		int rowCount = service.getRowCount();
		PageParam pageParam = new PageParam();
		pageParam.setRowCount(rowCount);
		if (pageParam.getTotalPage() < currPage) {
			currPage = pageParam.getTotalPage();
		}
		pageParam.setCurrPage(currPage);
		pageParam = service.getUserListByPage(pageParam);
		
		request.setAttribute("pageParam", pageParam);		
		return "index";
	}
	
}
