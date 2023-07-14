<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수저접수 현황</title>
<style>
#collection-tbl {
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	border-collapse: collapse;
}

#collection-tbl th, td {
	border-left: 2px solid black;
	padding: 10px 40px;
}

#collection-tbl tr :first-of-type {
	border-left: none;
}

.collection-wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 30px;
}

<%--윤아님 cssList--%>
.left-div ul {
	list-style: none;
	padding: 0;
	margin: 0;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.left-div ul li {
	display: list-item;
	margin-bottom: 10px;
}

.left-div ul a {
	display: inline-block;
	width: 160px;
	height: 30px;
	border-radius: 15px;
	background-color: #e9e9e9;
	text-align: center;
	line-height: 30px;
	text-decoration: none;
	color: #000000;
}

.left-div ul a:hover {
	background-color: #49B466;
	color: #fff;
}

.left-div ul .active a {
	background-color: #49B466;
	color: #fff;
}

.left-div {
	display: flex;
	flex-direction: column;
	align-items: left;
	margin-left: 180px;
	width: 200px;
	float: left;
}

input {
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}

.btn {
	border: solid 2px #24873a;
	border-radius: 50px;
	width: 25%;
	text-align: center;
	padding: 0.5rem;
	margin: 20px;
	margin-top: 20px;
	font-size: large;
	display: flex;
	justify-content: center;
	align-items: center;
}

.right-div {
	flex: 1;
	margin-left: 500px;
	flex-direction: column;
	display: flex;
	flex-wrap: wrap;
	width: 1200px;
}

.mypage-wrap {
	padding-top: 5rem;
	padding-bottom: 8rem;
}

.con {
	float: left;
}

h2 {
	margin-left: 60px;
}
</style>
</head>
<body>

	<div id="wrapper">
		<div id="container_wr">
			<div id="con">
				<script
					src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
				<div class="mypage-wrap">
					<div class="container">

						<div class="left-div">
							<h2>마이페이지</h2>
							<ul>
								<li class="active"><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/member/myPage">회원정보
										수정</a></li>
								<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.U){ %>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/member/requestList">수거신청
										내역</a></li>
								<% } else if(loginMember != null && loginMember.getMemberRole() == MemberRole.R) { %>
								<li><a class="" aria-current="page"
									href="<%= request.getContextPath() %>/rider/requestCollectionList">수거
										리스트</a></li>
								<% } %>
							</ul>
						</div>
					</div>
					<div class="collection-wrapper">
						<div class="collection-sub">
							<h3>수거접수 리스트</h3>
							<table id="collection-tbl">
								<thead>
									<tr>
										<th>접수번호</th>
										<th>접수자</th>
										<th>접수지역</th>
										<th>접수사진</th>
										<th>접수일자</th>
										<th>접수현황</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script> 
window.onload = () => { 
	findAllList(); 
} 
const findAllList = () =>{

	 $.ajax({ 
	 	url : "<%=request.getContextPath()%>/rider/findAllRequest",
	 	data : "json",
	 	success(responseData){
			
	 		console.log(responseData);
	 		
	 	}
	 
	 
	});
} 
</script>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>