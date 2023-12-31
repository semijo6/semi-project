<%@page import="com.threego.app.board.model.vo.Board"%>
<%@page import="com.threego.app.warning.model.vo.WarnigMemberRole"%>
<%@page import="com.threego.app.warning.model.vo.Warning"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int lastMonthPayment = (int)request.getAttribute("lastMonthPayment")*5000;
	int thisMonthPayment = (int)request.getAttribute("thisMonthPayment")*5000;
	
	int todayPayment = (int)request.getAttribute("todayPayment")*5000;
	int yesterdayPayment = (int)request.getAttribute("yesterdayPayment")*5000;
	int twoDayAgoPayment = (int)request.getAttribute("twoDayAgoPayment")*5000;
	int threeDayAgoPayment = (int)request.getAttribute("threeDayAgoPayment")*5000;
	
	List<Warning> warnings = (List<Warning>) request.getAttribute("warnings");
	List<Board> boards = (List<Board>) request.getAttribute("boards");
%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" />
    <title>AdminPage</title>
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  <body>
    <section>
      <div class="leftBar">
        <div class="logo">
          쓰레기버려조
        </div>
        <hr />
        <div class="serviceName">
          <img class="logoImg" src="<%=request.getContextPath()%>/img/threeGologo2.png" alt=""> 쓰리고
        </div>
        <di class="goToMainSite">
          <span>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-square" viewBox="0 0 16 16">
              <path
                fill-rule="evenodd"
                d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.854 8.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707l-4.096 4.096z"
              />
            </svg>
          </span>
          <a href="<%=request.getContextPath()%>">사이트 바로가기</a>
        </di>
        <hr />
        <h5 style="padding-left: 20px; padding-top: 10px">사이트 관리</h5>
        <div class="dashboard">
          <span>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-grid" viewBox="0 0 16 16">
              <path
                d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"
              />
            </svg>
          </span>
          <a href="<%=request.getContextPath()%>/admin/adminMain">대시보드</a>
        </div>
        <div class="memberManagement">
          <div class="wrap">
            <ul class="list">
              <li class="items">
                <div class="a_title">
                  <span>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                      <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5ZM9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8Zm1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Z" />
                      <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96c.026-.163.04-.33.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1.006 1.006 0 0 1 1 12V4Z"                      />
                    </svg>
                  </span>
                  <a href="">사용자 관리</a>
                  <span>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                      <path
                        d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"
                      />
                    </svg>
                  </span>
                </div>
                <div class="a_content">
                  <div class="userManagement">
                    <span>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                        <path
                          d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"
                        />
                      </svg>
                    </span>
                    <a href="<%=request.getContextPath()%>/admin/userList">회원정보조회</a>
                  </div>
                  <div class="riderManagement">
                    <span>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bicycle" viewBox="0 0 16 16">
                        <path
                          d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057 9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z"
                        />
                      </svg>
                    </span>
                    <a href="<%=request.getContextPath()%>/admin/riderManagement">수고미 관리</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="qanda">
          <span>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-text" viewBox="0 0 16 16">
              <path
                d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"
              />
              <path
                d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8zm0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"
              />
            </svg>
          </span>
          <a href="<%= request.getContextPath()%>/admin/adminInquiry">문의사항</a>
        </div>
        
        <div class="reportManagement">
          <span>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
              <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
            </svg>
          </span>
          <a href="<%=request.getContextPath()%>/admin/reportList">신고내역</a>
        </div>
        
        <div class="reportManagement">
          <span>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
			  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
			</svg>
		  </span>
          <a href="<%=request.getContextPath()%>/admin/writeNotice">공지사항 작성</a>
        </div>
        
        <hr>
        <div class="showMeTheMoney">
          <span>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-piggy-bank" viewBox="0 0 16 16">
              <path d="M5 6.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0zm1.138-1.496A6.613 6.613 0 0 1 7.964 4.5c.666 0 1.303.097 1.893.273a.5.5 0 0 0 .286-.958A7.602 7.602 0 0 0 7.964 3.5c-.734 0-1.441.103-2.102.292a.5.5 0 1 0 .276.962z"/>
              <path fill-rule="evenodd" d="M7.964 1.527c-2.977 0-5.571 1.704-6.32 4.125h-.55A1 1 0 0 0 .11 6.824l.254 1.46a1.5 1.5 0 0 0 1.478 1.243h.263c.3.513.688.978 1.145 1.382l-.729 2.477a.5.5 0 0 0 .48.641h2a.5.5 0 0 0 .471-.332l.482-1.351c.635.173 1.31.267 2.011.267.707 0 1.388-.095 2.028-.272l.543 1.372a.5.5 0 0 0 .465.316h2a.5.5 0 0 0 .478-.645l-.761-2.506C13.81 9.895 14.5 8.559 14.5 7.069c0-.145-.007-.29-.02-.431.261-.11.508-.266.705-.444.315.306.815.306.815-.417 0 .223-.5.223-.461-.026a.95.95 0 0 0 .09-.255.7.7 0 0 0-.202-.645.58.58 0 0 0-.707-.098.735.735 0 0 0-.375.562c-.024.243.082.48.32.654a2.112 2.112 0 0 1-.259.153c-.534-2.664-3.284-4.595-6.442-4.595zM2.516 6.26c.455-2.066 2.667-3.733 5.448-3.733 3.146 0 5.536 2.114 5.536 4.542 0 1.254-.624 2.41-1.67 3.248a.5.5 0 0 0-.165.535l.66 2.175h-.985l-.59-1.487a.5.5 0 0 0-.629-.288c-.661.23-1.39.359-2.157.359a6.558 6.558 0 0 1-2.157-.359.5.5 0 0 0-.635.304l-.525 1.471h-.979l.633-2.15a.5.5 0 0 0-.17-.534 4.649 4.649 0 0 1-1.284-1.541.5.5 0 0 0-.446-.275h-.56a.5.5 0 0 1-.492-.414l-.254-1.46h.933a.5.5 0 0 0 .488-.393zm12.621-.857a.565.565 0 0 1-.098.21.704.704 0 0 1-.044-.025c-.146-.09-.157-.175-.152-.223a.236.236 0 0 1 .117-.173c.049-.027.08-.021.113.012a.202.202 0 0 1 .064.199z"/>
            </svg>
          </span>
          <a href="<%=request.getContextPath()%>/admin/paymentList">매출조회</a>
        </div>
      </div>
      <section style="width: 1630px">
        <nav class="navbar bg-light" style="margin-left: 330px">
          <div class="container-fluid">
            <a class="navbar-brand" href="#">쓰리고</a>
          </div>
        </nav>
      </section>
    </section>
    <section>
      <div class="card" style="margin: 30px 0 0 330px; width: 1300px; height: 150px">
        <div class="card-header" id="todayIssueHeader">
          오늘의 이슈
          <span class="badge text-bg-secondary" style="background-color: tomato">
            <%=(Integer)session.getAttribute("todayCount")  + (Integer)session.getAttribute("todayPaymentCount") +
            (Integer)session.getAttribute("unapprovedRiderCount") + (Integer)session.getAttribute("canceledRequestCount") +
            (Integer)session.getAttribute("warningCount") + (Integer)session.getAttribute("countOfBoardWithOutComment")%>
          </span>
        </div>
        <div class="card-body" id="todayIssueBody">
          <span>신규가입</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600"><%=session.getAttribute("todayCount")%></span>
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <span>신규주문</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600"><%=session.getAttribute("todayPaymentCount")%></span>
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <span>수고미 승인</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600"><%=session.getAttribute("unapprovedRiderCount")%></span>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <br />
          <br />
          <span>수거취소</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600"><%=session.getAttribute("canceledRequestCount")%></span>
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <span>신고내역</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600"><%=session.getAttribute("warningCount")%></span>
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <span>답변대기문의</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600"><%=session.getAttribute("countOfBoardWithOutComment")%></span>
          &nbsp;&nbsp;&nbsp;&nbsp;
        </div>
      </div>
    </section>
    <section>
      <div class="container text-center" style="margin: 30px 0 0 320px">
        <div class="row row-cols-2">
          <div class="col">
            <div class="card" style="width: 635px;">
              <div class="card-header">가입자/주문 현황</div>
              <div class="card-body">
                <div id="curve_chart" style="width: 630px; height: 350px"></div>
              </div>
            </div>

          </div>

          <div class="col">
            <div class="card" style="width: 635px;">
              <div class="card-header">
              	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;통계
              	<span style="float: right;">
	              <button id="month" style="border: none;">월별</button>
	              <button id="day" style="border: none;">일별</button>              	
              	</span>
              </div>
              <div class="card-body">
                <div id="columnchart_material1" style="width: 600px; padding: 80px 0 0 20px;"></div>
                <div id="columnchart_material2" style="width: 600px; padding: 80px 0 0 20px; "></div>
              </div>
            </div>
          </div>
          <div class="col" style="padding-top: 20px">
            <div class="card" style="width: 635px; height:540px;">
              <div class="card-header">문의사항</div>
              <div class="card-body">
                <%
                                if(boards != null && !boards.isEmpty()) {
                                %>
                <%
                for(Board board : boards) {
                %>
                <div class="warning-box" style="display: flex; padding: 20px 0 0 20px;">
                  <div class="warning-img">
                    <img src="<%=request.getContextPath()%>/img/threeGologo.png" style="width: 60px;">
                  </div>
                  <div class="warning-content" style="float: left; text-align: left; line-height: 0.7; padding-top: 9px;">
                    <p style="font-weight: 600;">
                    [문의사항] <%=board.getBoardTitle()%></p>
                    <p style="font-size: 13px;">&nbsp;<%=board.getBoardWriter()%> | <%=board.getBoardRegDate()%></p>
                  </div>
                </div>
                	<%
                	}
                	%>
                <%
                }
                %>
              </div>
            </div>
          </div>
          <div class="col" style="padding-top: 20px">
            <div class="card" style="width: 635px; height:540px;">
              <div class="card-header">신고현황</div>
              <div class="card-body">
                
                <%
                if(warnings != null && !warnings.isEmpty()){ 
                                    for(Warning warning : warnings){
                %>
                <div class="warning-box" style="display: flex; padding: 20px 0 0 20px;">
                  <div class="warning-img">
                    <img src="<%=request.getContextPath()%>/img/threeGologo.png" style="width: 60px;">
                  </div>
                  <div class="warning-content" style="float: left; text-align: left; line-height: 0.7; padding-top: 9px;">
                    <p style="font-weight: 600;">
                    	<%
                    	String originalText = warning.getWarningContent();
                    					    int maxLength = 20;
                    					
                    					    String truncatedText = originalText;
                    					    if (originalText.length() > maxLength) {
                    					    	truncatedText = originalText.substring(0, maxLength) + "...";
                    					    }
                    	%>
						<%
						if(warning.getMemberRole()== WarnigMemberRole.U) {
						%>
							[수고미 신고]
						<% } else { %>
							[유저 신고]
						<% } %>
						<%= truncatedText %>
                    </p>
                    <p style="font-size: 13px;">&nbsp;<%= warning.getWarningWriter() %> | <%= warning.getWarningRegDate() %></p>
                  </div>
                </div>
                	<% } %>
                <% } %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <footer></footer>
    <script>
	const monthButton = document.getElementById('month');
	const dayButton = document.getElementById('day');
    const monthChart = document.getElementById('columnchart_material1');
    const dayChart = document.getElementById('columnchart_material2');
	
	monthButton.onclick = () => {
		monthChart.style.display = 'block';
		dayChart.style.display = 'none';
	}
	
	dayButton.onclick = () => {
		monthChart.style.display = 'none';
		dayChart.style.display = 'block';
	}
	
    let today = new Date();
    let yesterday = new Date();
    yesterday.setDate(yesterday.getDate()-1);
    let twoDayAgo = new Date();
    twoDayAgo.setDate(twoDayAgo.getDate()-2);
    let threeDayAgo = new Date();
    threeDayAgo.setDate(threeDayAgo.getDate()-3);
    
    let todMonth = today.getMonth()+1;
    let todDay = today.getDate();
    let yesMonth = yesterday.getMonth()+1;
    let yesDay = yesterday.getDate();
    let twoMonth = twoDayAgo.getMonth()+1;
    let twoDay = twoDayAgo.getDate();
    let threeMonth = threeDayAgo.getMonth()+1;
    let threeDay = threeDayAgo.getDate();
    
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart1);

    function drawChart1() {
	    var data = google.visualization.arrayToDataTable([
	        ['Date', '가입수', '주문수'],
	        [threeMonth+'/'+threeDay,  <%= session.getAttribute("threeDayAgoCount")%>,      <%= session.getAttribute("threeDayAgoPaymentCount")%>],
	        [twoMonth+'/'+twoDay,  <%= session.getAttribute("twoDayAgoCount")%>,      <%= session.getAttribute("twoDayAgoPaymentCount")%>],
	        [yesMonth+'/'+yesDay,  <%= session.getAttribute("yesterdayCount")%>,      <%= session.getAttribute("yesterdayPaymentCount")%>],
	        [todMonth+'/'+todDay,  <%= session.getAttribute("todayCount")%>,      <%= session.getAttribute("todayPaymentCount")%>]
	    ]);
	
	    var options = {
	        curveType: 'function',
	        legend: { position: 'bottom' }
	    };
	
	    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
	
	    chart.draw(data, options);
	}
    
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart2);

    function drawChart2() {
        var data = google.visualization.arrayToDataTable([
            ['Month', 'Sales'],
            ['6월', <%= lastMonthPayment %>],
            ['7월', <%= thisMonthPayment %>]
        ]);

        var options = {
            chart: {
                title: '월별 통계(단위:만원)',
                //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
            }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material1'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
    }
    
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart3);
    
    function drawChart3() {
        var data = google.visualization.arrayToDataTable([
            ['Day', 'Sales'],
            [threeMonth+'/'+threeDay, <%= threeDayAgoPayment %>],
            [twoMonth+'/'+twoDay, <%= twoDayAgoPayment %>],
            [yesMonth+'/'+yesDay, <%= yesterdayPayment %>],
            [todMonth+'/'+todDay, <%= todayPayment %>]
        ]);

        var options = {
            chart: {
                title: '일별 통계(단위:만원)',
                //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
            }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material2'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
    }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="<%=request.getContextPath() %>/js/adminMain.js"></script>
  </body>
</html>

