package com.threego.app.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.threego.app.admin.model.exception.AdminException;
import com.threego.app.member.model.exception.MemberException;
import com.threego.app.member.model.vo.Member;
import com.threego.app.member.model.vo.MemberRole;
import com.threego.app.msgbox.model.vo.MsgBox;
import com.threego.app.msgbox.model.vo.MsgConfirm;
import com.threego.app.msgbox.model.vo.MsgType;
import com.threego.app.payment.model.vo.PaymentDetail;
import com.threego.app.request.model.vo.Request;
import com.threego.app.ticket.model.vo.TicketPayment;

public class MemberDao {
	
	Properties prop = new Properties();
	
	public MemberDao() {
		
		String filename = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member findById(Connection conn, String id) {
		
		Member member = null;
		String sql = prop.getProperty("findById");
		// select * from member where id = ?
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			try(ResultSet rset = pstmt.executeQuery()){    
				
				while(rset.next()) {
					
					member = handleMemberResultSet(rset);
					
				}
				
			}
			
		} catch (SQLException e) {
			
			throw new MemberException(e);
		}
		
		return member;
	}

	private Member handleMemberResultSet(ResultSet rset) throws SQLException {
		Member member;
		String member_id = rset.getString("id");
		String pwd = rset.getString("pwd");
		String name = rset.getString("name");
		String email = rset.getString("email");
		String phone = rset.getString("phone");
		MemberRole member_role = MemberRole.valueOf(rset.getString("member_role"));
		String post = rset.getString("post");
		String address = rset.getString("address");
		Date regDate = rset.getDate("reg_date");
	 
		return new Member(member_id, pwd, name, email, phone, member_role, post, address, regDate);
	}


	public Member findByEmail(Connection conn, String email) {
		
		Member member = null; 
		String sql = prop.getProperty("findByEmail");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
		
			pstmt.setString(1, email);
			
			try(ResultSet rset = pstmt.executeQuery()){
				
				while(rset.next()) {
					
					member = handleMemberResultSet(rset);
				}
			}
			
		} catch (SQLException e) {

			throw new MemberException(e);
		
		}
		return member;
	}
	
	
	public int updateMember(Connection conn, Member member) {
		int result = 0;
		String sql = prop.getProperty("updateMember");
		// update member set pwd = ?, email = ?, phone = ?, post = ?, address = ? where id = ?
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, member.getPwd());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getPost());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}
	
	public int insertMember(Connection conn, Member member) {
		int result =0;
		String sql = prop.getProperty("insertMember");
		//insertMember = insert into member values(?,?,?,?,?,default,?,?,default)
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getPost());
			pstmt.setString(7, member.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}

	public int updatePwd(Connection conn, String id, String pwd) {
		int result = 0;
		String sql = prop.getProperty("updatePwd");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			throw new MemberException(e);
		}
		
		
		
		return result;
	}


	public int findByPhone(Connection conn, String phone) {
		int result =0;
		String sql =prop.getProperty("findByPhone");
		// findByPhone = select count(*) from member where phone = ?
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, phone);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}


	public List<PaymentDetail> findPaymentList(Connection conn, String memberId) {
		List<PaymentDetail> requestList = new ArrayList<>();
		String sql = "select * from paymentDetail where pd_mem_id = ?";
		
		try ( PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, memberId);
			ResultSet rset = pstmt.executeQuery();
			
			int count = 1;
			
			while(rset.next()) {
				String pdId = rset.getString("pd_mem_id");
				String pdTicId = rset.getString("pd_tic_id");
			    int pdTicPrice = rset.getInt("pd_tic_price");
			    Date pdDate = rset.getDate("pd_date");
			    
			    PaymentDetail ticketPayment = new PaymentDetail();
				ticketPayment.setPd_no(count++);
				ticketPayment.setPd_mem_id(pdTicId);
				ticketPayment.setPd_tic_id(pdTicId);
			    ticketPayment.setPd_tic_price(pdTicPrice);
			    ticketPayment.setPd_date(pdDate);

			    // 생성한 TicketPayment 객체를 requestList에 추가
			    requestList.add(ticketPayment);
			}
			
			
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return requestList;
	}

	public List<Request> findRequestList(Connection conn, String memberId) {
		List<Request> reqList = new ArrayList<>();
		  String sql = "SELECT req_no, req_writer, req_location_id, req_post, req_address, req_photo, req_status, req_date, req_rider, req_cp_date " +
	                 "FROM request " +
	                 "WHERE req_writer = ? ORDER BY req_no desc";
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, memberId);
			
			try(ResultSet rset = pstmt.executeQuery()){

				while(rset.next()){
					Request request = handleRequestResultSet(rset);
					reqList.add(request);
				}
			}
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return reqList;
	}
	
	private Request handleRequestResultSet(ResultSet rset) throws SQLException {
		int reqNo = rset.getInt("req_no");
		String reqWriter = rset.getString("req_writer");
		String reqLocationId = rset.getString("req_location_id");
		String reqPost = rset.getString("req_post");
		String reqAddress = rset.getString("req_address");
		String reqPhoto = rset.getString("req_photo");
		String reqStatus = rset.getString("req_status");
		Date reqData = rset.getDate("req_date");
		String reqRider = rset.getString("req_rider");
		Date reqCpDate = rset.getDate("req_cp_date");

		return new Request(reqNo, reqWriter, reqLocationId, reqPost, reqAddress, reqPhoto, reqStatus, reqData, reqRider, reqCpDate);
	}

	public List<MsgBox> getMsgBoxListPaging(Connection conn, String memberId, int start, int end) {
		List<MsgBox> msgBoxes = new ArrayList<>();
		String sql = prop.getProperty("getMsgBoxListPaging");
		// select * from msgbox where msg_receiver = ? order by msg_no desc
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, memberId);
			
			try(ResultSet rset = pstmt.executeQuery()){

				while(rset.next()){
					MsgBox msgBox = handleMsgBoxResultSet(rset);
					msgBoxes.add(msgBox);
				}
			}
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return msgBoxes;
	}

	private MsgBox handleMsgBoxResultSet(ResultSet rset) throws SQLException {
		MsgBox msgBox = new MsgBox();
		msgBox.setMsgNo(rset.getInt("msg_no"));
		MsgType msgType = MsgType.valueOf(rset.getString("msg_type"));
		msgBox.setMsgType(msgType);
		msgBox.setMsgSender(rset.getString("msg_sender"));
		msgBox.setMsgReceiver(rset.getString("msg_receiver"));
		msgBox.setMsgContent(rset.getString("msg_content"));
		msgBox.setMsgSendingDate(rset.getDate("msg_sending_date"));
		MsgConfirm msgConfirm = MsgConfirm.valueOf(rset.getString("msg_confirm"));
		msgBox.setMsgConfirm(msgConfirm);
		
		return msgBox;
	}


	public int updateMsgBoxConfirm(Connection conn, int msgNo) {
		int result =0;
		String sql =prop.getProperty("updateMsgBoxConfirm");
		// updateMsgBoxConfirm = update msgbox set msg_confirm = 'O' where msg_no = ?
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, msgNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}

	public int getTotalMsg(Connection conn, String memberId) {
		int totalMsg = 0;
		String sql = prop.getProperty("getTotalMsg");
		// select count(*) from msgbox where msg_receiver = ?
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, memberId);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next())
					totalMsg = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return totalMsg;
	}

	public List<MsgBox> getMsgBoxList(Connection conn, String id) {
		List<MsgBox> msgBoxes = new ArrayList<>();
		String sql = prop.getProperty("getMsgBoxList");
		// select * from msgbox where msg_receiver = ?
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, id);
			
			try(ResultSet rset = pstmt.executeQuery()){

				while(rset.next()){
					MsgBox msgBox = handleMsgBoxResultSet(rset);
					msgBoxes.add(msgBox);
				}
			}
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return msgBoxes;
	}

	public PaymentDetail findTotalPrice(Connection conn, String memberId) {
		
		PaymentDetail totalPrice = new PaymentDetail();
		 String sql = "SELECT pd_mem_id, SUM(pd_tic_price) AS total_price " +
			                 "FROM paymentDetail " +
			                 "WHERE pd_mem_id = ? " +
			                 "GROUP BY pd_mem_id";
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, memberId);
			try(ResultSet rset = pstmt.executeQuery()){
				
				int count = 1;
				
				while(rset.next()) {
				      String pdId = rset.getString("pd_mem_id");
		                int pdTicPrice = rset.getInt("total_price");

		                totalPrice.setPd_mem_id(pdId);
		                totalPrice.setPd_tic_price(pdTicPrice);
				}
			}
			
		} catch (SQLException e) {
			
			throw new MemberException(e);
		}
		
		return totalPrice;

	}


}
