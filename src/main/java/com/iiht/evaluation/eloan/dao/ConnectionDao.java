package com.iiht.evaluation.eloan.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.iiht.evaluation.eloan.dto.LoanDto;
import com.iiht.evaluation.eloan.exception.LoanException;
import com.iiht.evaluation.eloan.model.ApprovedLoan;
import com.iiht.evaluation.eloan.model.LoanInfo;
import com.iiht.evaluation.eloan.model.User;


public class ConnectionDao {
	private static final long serialVersionUID = 1L;
	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;

	public ConnectionDao(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

	public  Connection connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
		return jdbcConnection;
	}

	public void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
	
	// put the relevant DAO methods here.. 11/06
	
	public static final String INS_USER_QRY = "INSERT INTO user(username,password) VALUES(?,?)";
	public static final String GET_USER_QRY = "SELECT * FROM user WHERE username=?";
//	public static final String UPD_USER_QRY = "UPDATE user SET password=? WHERE username=?";
	public static final String INS_LOANINFO_QRY = "INSERT INTO loanInfo(purpose,amtRequested,doa,bstructure,bindicator,tindicator,address,email,mobile,status) VALUES(?,?,?,?,?,?,?,?,?,?)";
	public static final String UPD_LOANINFO_QRY = "UPDATE loanInfo SET purpose=?,amtRequested=?,doa=?,bstructure=?,bindicator=?,tindicator=?,address=?,email=?,mobile=? WHERE applno=?";
	public static final String SELECT_BY_ID_QRY = "SELECT purpose,amtRequested,doa,bstructure,bindicator,tindicator,address,email,mobile,status FROM loanInfo WHERE applno=?";
	public static final String SELECT_ALL_QRY = "SELECT applno,purpose,amtRequested,doa,bstructure,bindicator,tindicator,address,email,mobile,status FROM loanInfo";

	Logger log = Logger.getLogger("dao");
	
	public User addUser(User user) throws LoanException, SQLException {
		connect();
		try {
			PreparedStatement pst=jdbcConnection.prepareStatement(INS_USER_QRY);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.executeUpdate();
		} catch (SQLException e) {
			log.error(e);
			throw new LoanException("User details could not be saved");
		}
		return user;
	}
	
	public User getUser(String username) throws LoanException, SQLException {
		connect();
		User user=null;
		try(
			PreparedStatement pst = jdbcConnection.prepareStatement(GET_USER_QRY)){
			pst.setString(1, username);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUsername(rs.getString(1));
				user.setPassword(rs.getString(2));				
			}
		} catch (SQLException e) {
			log.error(e);
			throw new LoanException("User details could not be fetched");
		}
		return user;
	}
	public LoanInfo add(LoanInfo loan) throws LoanException, SQLException {
		connect();
//		if (loan != null) {
			try (
				PreparedStatement ps = jdbcConnection.prepareStatement(INS_LOANINFO_QRY,Statement.RETURN_GENERATED_KEYS) ){

//				ps.setString(1, loan.getApplno());
				ps.setString(1, loan.getPurpose());
				ps.setLong(2, loan.getAmtrequest());
				ps.setDate(3, Date.valueOf(loan.getDoa()));
				ps.setString(4, loan.getBstructure());
				ps.setString(5, loan.getBindicator());
				ps.setString(6, loan.getTindicator());
				ps.setString(7, loan.getAddress());
				ps.setString(8, loan.getEmail());
				ps.setString(9, loan.getMobile());
				ps.setString(10, loan.getStatus());				

				ps.executeUpdate();
				ResultSet rs=ps.getGeneratedKeys();
				String applno=rs.getString(1);
				System.out.println(applno);
			} catch (SQLException exp) {
				log.error(exp);
				throw new LoanException("Operation Failed Due To An Error!");
			}
//		}
		return loan;
	}
	
	public LoanInfo update(LoanInfo loan) throws LoanException, SQLException {
		connect();
		if (loan != null) {
			try (
				PreparedStatement ps = jdbcConnection.prepareStatement(UPD_LOANINFO_QRY)) {
				ps.setString(1, loan.getPurpose());
				ps.setLong(2, loan.getAmtrequest());
				ps.setDate(3, Date.valueOf(loan.getDoa()));
				ps.setString(4, loan.getBstructure());
				ps.setString(5, loan.getBindicator());
				ps.setString(6, loan.getTindicator());
				ps.setString(7, loan.getAddress());
				ps.setString(8, loan.getEmail());
				ps.setString(9, loan.getMobile());

				ps.executeUpdate();
			} catch (SQLException exp) {
				log.error(exp);
				throw new LoanException("Operation Failed Due To An Error!");
			}
		}
		return loan;
	}
	
	public LoanInfo getById(int applno) throws LoanException, SQLException {
		connect();
		LoanInfo loan=null;
		try (
			PreparedStatement ps = jdbcConnection.prepareStatement(SELECT_BY_ID_QRY)) {

			ps.setInt(1, applno);

			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				loan = new LoanInfo();
				loan.setApplno(rs.getString(1));
				loan.setPurpose(rs.getString(2));
				loan.setAmtrequest(rs.getInt(3));
				loan.setDoa(rs.getString(4));
				loan.setBstructure(rs.getString(5));
				loan.setBindicator(rs.getString(6));
				loan.setTindicator(rs.getString(7));
				loan.setAddress(rs.getString(8));
				loan.setEmail(rs.getString(9));
				loan.setMobile(rs.getString(10));
				loan.setStatus(rs.getString(11));
			}
		} catch (SQLException exp) {
			log.error(exp);
			throw new LoanException("Operation Failed Due To An Error!");
		}		
		return loan;
	}
	public List<LoanInfo> getAll() throws LoanException, SQLException {
		connect();
		List<LoanInfo> loans=new ArrayList<LoanInfo>();
		try ( 
			PreparedStatement ps = jdbcConnection.prepareStatement(SELECT_ALL_QRY)) {

			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				LoanInfo loan = new LoanInfo();
				loan.setApplno(rs.getString(1));
				loan.setPurpose(rs.getString(2));
				loan.setAmtrequest(rs.getInt(3));
				loan.setDoa(rs.getString(4));
				loan.setBstructure(rs.getString(5));
				loan.setBindicator(rs.getString(6));
				loan.setTindicator(rs.getString(7));
				loan.setAddress(rs.getString(8));
				loan.setEmail(rs.getString(9));
				loan.setMobile(rs.getString(10));
				loan.setStatus(rs.getString(11));
				
				loans.add(loan);
			}
		} catch (SQLException exp) {
			log.error(exp);
			throw new LoanException("Operation Failed Due To An Error!");
		}		
		return loans;
	}


	
	
	
}
