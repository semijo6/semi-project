<%@page import="com.threego.app.rider.model.vo.Rider"%>
<%@page import="com.threego.app.warning.model.vo.WarnigMemberRole"%>
<%@page import="com.threego.app.warning.model.vo.Warning"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Rider> riders = (List<Rider>) request.getAttribute("riders");
	List<Rider> waitingRiders = (List<Rider>) request.getAttribute("waitingRiders");
	String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg"); // 1회용
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/report.css" />
    <style>
    	div#pagebar{margin-top:5px; text-align:center; background-color:rgba(0, 0, 0, 0.03); width: 1250px;}
		div#pagebar a{margin-right: 5px; color: green; font-size: 20px}
    </style>
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
    <title>ReportList</title>
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
            <a href="<%=request.getContextPath()%>/admin/adminInquiry">문의사항</a>
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
        </section>
        <section style="width: 1630px">
          <nav class="navbar bg-light" style="margin-left: 330px">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">쓰리고</a>
            </div>
          </nav>
        </section>
        <section>
	        <div class="buttonBox" style="margin-top:50px; margin-left:330px;">
    	        <button type="button" class="btn btn-primary" id="lookUpRider">수고미 조회</button>
    	        <button type="button" class="btn btn-primary position-relative" id="approveRider">
 				 수고미 승인
				  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
				    <%= request.getAttribute("unapprovedRiderCount2") %>
				    <span class="visually-hidden">unread messages</span>
				  </span>
				</button>
        	</div>
        	<div class="container" id="approveRiderContainer" style="display:none;">
         		<div class="vh-100 justify-content-center" style="margin-top:40px;">
        	<% if(waitingRiders != null && !waitingRiders.isEmpty()) { %>
        		<% for(Rider waitingRider : waitingRiders) { %>
		            <div class="card mb-3" style="margin-left:330px; width: 500px; height:200px;">
		              <div class="row g-0">
		                <div class="col-md-4">
		                  <img src="<%= request.getContextPath() %>/img/threeGologo.png" style="padding-top:25px; width:150px;" class="img-fluid rounded-start" alt="...">
		                </div>
		                <div class="col-md-8">
		                  <div class="card-body" >
		                    <span class="card-title" style="font-size:20px; padding-top:12px; font-weight:600;">ThreeGo Rider</span>
		                    <!-- 근로계약서 모달창 -->
		                    &nbsp;&nbsp;&nbsp;&nbsp;
		                    <button type="button"  data-bs-toggle="modal" data-bs-target="#exampleModal">
  								근로계약서 보기
							</button>
		                    <div class="modal fade"  id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" >
							    <div class="modal-content" style="width:700px;">
							      <div class="modal-header" style="width:700px;">
							        <h1 class="modal-title fs-5" id="exampleModalLabel">근로계약서</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							      	<iframe style="width:100%; height:80vh;" src="<%= request.getContextPath() %>/upload/file/<%=waitingRider.getFileName()%>"></iframe>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							      </div>
							    </div>
							  </div>
							</div>
		                    <p style="padding-top:10px;" class="card-text">아이디 : <%= waitingRider.getRiderId() %></p>
		                    <p class="card-text">이름 : <%= waitingRider.getRiderName() %></p>
		                    <p class="card-text">활동구역 : <%= waitingRider.getRiderLocationId() %>(<%= waitingRider.getRiderLocationName() %>)</p>
		                    <div style="display:flex">
			                    <form action="<%= request.getContextPath() %>/admin/riderApprovement" name="riderApprovementFrm" method="post">
			    					<input type="hidden" name="riderId" id="riderId" value="<%= waitingRider.getRiderId()%>">
			                    	<button class="card-text" id="approveButton" style="border-style: none; background-color: white;"><small class="text-muted" >승인</small></button>
			    				</form>
			                    &nbsp; &nbsp; &nbsp;
		                    	<form action="<%= request.getContextPath() %>/admin/riderRefusal" name="riderRefusalFrm" method="post">
		    						<input type="hidden" name="riderRefusalId" id="riderRefusalId" value="<%= waitingRider.getRiderId()%>">
			                    	<button class="card-text" id="rejectButton" style="border-style: none; background-color: white;"><small class="text-muted">반려</small></button>		                    
		    					</form>
		                    </div>
		                  </div>
		                </div>
		              </div>
            		</div>
            		<% } %>
            	<% } else { %>
            	<p>승인대기중인 수고미가 없습니다.</p>
            	<% } %>
          		</div> <!-- vh100 끝 -->
        	</div> <!-- container 끝 -->
        	<div class="card" style="margin: 30px 0 0 330px; width: 1300px; display:none;" id="riderList">
                <div class="card-header" id="todayIssueHeader">
                수고미 목록
                </div>
                <div class="card-body" id="todayIssueBody" >
                    <table>
                    	<thead>
                    		<tr>
		                        <th style="width: 300px;">ID</th>
		                        <th style="width: 500px;">지역코드(지역)</th>
		                        <th>수고미 승인일</th>
                    		</tr>
                    	</thead>
                        <tbody>
                        	<%  if(riders!=null && !riders.isEmpty()) { %>
                        		<% for(Rider rider : riders) { %>
                        			<tr>
										 <td><%= rider.getRiderId() %></td>
										 <td><%= rider.getRiderLocationId() %>(<%= rider.getRiderLocationName() %>)</td>
										 <td><%= rider.getRiderUpDate() %></td>                       		
									</tr>
								<% } %>
							<% } %>
                        </tbody>
                    </table>
                </div>
        	</div>
        	
		   
        </section>
        <script>
	        <% 	if(msg != null) { %>
			alert('<%= msg %>');
			<% 	} %>
        	// 수고미 조회, 승인 버튼 이벤트
        	const lookUpRiderButton = document.querySelector("#lookUpRider");
        	const riderList = document.querySelector("#riderList");
        	const approveRiderContainer = document.querySelector("#approveRiderContainer");
        	const approveRiderButton = document.querySelector("#approveRider");
        	
        	lookUpRiderButton.onclick = (e) => {
        		riderList.style.display = "block";
        		approveRiderContainer.style.display = "none";
        	};
        	
        	
        	approveRiderButton.onclick = (e) => {
        		approveRiderContainer.style.display = "block";
        		riderList.style.display = "none";
        	};
        	
        	// 승인 이벤트
        	document.querySelectorAll("#approveButton").forEach((item) => {
	        	item.onclick = (e) => {
	        		if(confirm('승인하시겠습니까?')) {
	        			const frm = document.riderApprovementFrm;
	        			const hiddenVal = frm.querySelector("#riderId");
	        				
	        			console.log(hiddenVal.value);
	        			frm.submit();
	        				
	        		} else {
	        			return false;
	        		}
	        	};
        	})
        	
        	document.querySelector("#rejectButton").forEach((item) => {
	        	item.onclick = (e) => {
	        		if(confirm('반려하시겠습니까?')) {
	        			const frm = document.riderRefusalFrm;
	        			const hiddenVal = frm.querySelector("#riderRefusalId")
	        			frm.submit();
	        		} else {
	        			return false;
	        		}
	        	}        		
        	});
        	
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    	<script src="<%= request.getContextPath() %>/js/adminMain.js"></script>
</body>
</html>