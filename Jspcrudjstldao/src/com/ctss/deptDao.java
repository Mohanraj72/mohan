package com.ctss;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import com.cts.Department;

public class deptDao {
	public static Connection connect() throws Exception, SQLException {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");

		return conn;
	}

	public int insert(Department dept) throws Exception, SQLException {
		Connection conn = connect();
		String insertQuery = "insert into dept values (?,?,?)";
		PreparedStatement st = conn.prepareStatement(insertQuery);
		st.setInt(1, dept.getDept_id());
		st.setString(2, dept.getDept_name());
		st.setString(3, dept.getStart_date());
		int insertStatus = 0;
		insertStatus = st.executeUpdate();
		return insertStatus;
	}

	public int delete(int dept_id) throws Exception {
		Connection conn = connect();
		String deleteQuery = "delete from dept where dept_id=" + dept_id;
		int deleteStatus = 0;
		Statement stmt = conn.createStatement();
		deleteStatus = stmt.executeUpdate(deleteQuery);
		return deleteStatus;
	}

	public int update(Department dept) throws Exception {
		Connection conn = connect();
		String updateQuery = "update dept set dept_name=?,start_date=? where dept_id=?";
		PreparedStatement st = conn.prepareStatement(updateQuery);
		st.setInt(3, dept.getDept_id());
		st.setString(1, dept.getDept_name());
		st.setString(2, dept.getStart_date());
		int updateStatus = 0;
		updateStatus = st.executeUpdate();
		return updateStatus;
	}

	public Department read(int dept_id) throws Exception {
		Connection conn = connect();
		String readQuery = "select * from dept where dept_id=" + dept_id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		Department dept = new Department();
		if (rs.next()) {
			dept.setDept_id(rs.getInt(1));
			dept.setDept_name(rs.getString(2));
			dept.setStart_date(rs.getString(3));
		}
		return dept;
	}

	public List<Department> readAll() throws Exception {
		List<Department> deptList = new ArrayList<Department>();
		Connection conn = connect();
		String readQuery = "select * from dept";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		while (rs.next()) {
			Department dept = new Department();
			dept.setDept_id(rs.getInt(1));
			dept.setDept_name(rs.getString(2));
			dept.setStart_date(rs.getString(3));
			deptList.add(dept);
		}
		return deptList;
	}
}
