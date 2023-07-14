package com.threego.app.request.model.service;

import java.sql.Connection;
import java.util.List;

import com.threego.app.request.model.dao.RequestDao;
import com.threego.app.request.model.vo.Request;
import static  com.threego.app.common.util.JdbcTemplate.*;


public class RequestService {
	
	private final RequestDao requestDao = new RequestDao();

	public List<Request> findAllRequest() {
		Connection conn = getConnection();
		List<Request> requestList = requestDao.findAllRequest(conn); 
		close(conn);
		return requestList;
	}

}