package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	DBConnectionMgr mgr;
	ResultSet rs;
	public UserDAO() {
		mgr = DBConnectionMgr.getInstance();
	}

	public void insert(UserDTO dto) throws Exception {

		Connection con = mgr.getConnection();

		String sql = "insert into user values(?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, dto.getName());
		ps.setString(2, dto.getId());
		ps.setString(3, dto.getPw());
		ps.executeUpdate();
		
		mgr.freeConnection(con, ps);

	}
	
	
	public String select(UserDTO dto) throws Exception {

		Connection con = mgr.getConnection();

		String sql = "select * from user where id=? and pw=?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		
		ResultSet rs = ps.executeQuery();
		String name = "";
		if(rs.next()) {
			name = rs.getString(1);
		} else {
			System.out.println("");
		}
		
		mgr.freeConnection(con, ps, rs);
		
		return name;

	}

	
	
}