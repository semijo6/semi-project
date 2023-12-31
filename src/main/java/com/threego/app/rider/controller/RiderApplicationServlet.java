package com.threego.app.rider.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.threego.app.common.HelloMvcFileRenamePolicy;
import com.threego.app.rider.model.service.RiderService;
import com.threego.app.rider.model.vo.Rider;

/**
 * Servlet implementation class RiderApplicationServlet
 */
@WebServlet("/rider/riderApplication")
public class RiderApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final RiderService riderService = new RiderService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = getServletContext();
		String saveDirectory = application.getRealPath("/upload/file");
		// 파일하나당 최대크기 10MB 
		int maxPostSize = 1024 * 1024 * 10; 
		// 인코딩
		String encoding = "utf-8";

		// 파일명 재지정 정책객체
		// 한글.txt --> 20230629_160430123_999.txt
		FileRenamePolicy policy = new HelloMvcFileRenamePolicy();

		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

		// 1. 사용자 입력값 처리
		String id = multiReq.getParameter("id");

		Rider rider = new Rider();
		rider.setRiderId(id);

		rider = riderService.findRiderById(id);
		if(rider ==null) {

			String location = multiReq.getParameter("location");
			String filename = multiReq.getFilesystemName("upFile");
			Rider newRider = new Rider(id, location, null, null, null, null, null, filename);
			int result = riderService.insertRider(newRider);
			response.setContentType("application/json; charset=utf-8");

			Map<String, Object> map = new HashMap<>();
			map.put("result", "성공");
			new Gson().toJson(map, response.getWriter()); // 응답메세지에 src를 json문자열로 변환해 출력
		}else {

			response.setContentType("application/json; charset=utf-8");

			Map<String, Object> map = new HashMap<>();
			map.put("result", "실패");
			map.put("message", "이미 지원 후 승인 대기중 입니다.");
			new Gson().toJson(map, response.getWriter()); // 응답메세지에 src를 json문자열로 변환해 출력

		}



	}

}
