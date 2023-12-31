package com.threego.app.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threego.app.member.model.service.MemberService;
import com.threego.app.request.model.vo.Request;


/**
 * Servlet implementation class MemberRequestListServlet
 */
@WebServlet("/member/requestList")
public class MemberRequestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String memberId = request.getParameter("memberId");
		
		List<Request> requestList = memberService.findRequestList(memberId);
		
		request.setAttribute("requestList", requestList);
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/member/memberRequestList.jsp");
		reqDispatcher.forward(request, response);
	}

}
