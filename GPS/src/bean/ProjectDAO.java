package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProjectDAO {
	DBConnectionMgr mgr;
	ResultSet rs;
	public ProjectDAO() {
		mgr = DBConnectionMgr.getInstance();
	}

	public void insert(ProjectDTO dto) throws Exception {

		Connection con = mgr.getConnection();

		String sql = "insert into project values(?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, dto.getPname());
		ps.setInt(2, dto.getPscale());
		ps.setInt(3, dto.getPnom());
		ps.setInt(4, dto.getStartdate());
		ps.setInt(5, dto.getDuedate());
		ps.setString(6, dto.getPdescription());
		ps.setString(7, dto.getPcaptain());
		ps.executeUpdate();
		
		mgr.freeConnection(con, ps);

	}
	
	
	public ArrayList<ProjectDTO> select(String sessionName) throws Exception {
		ArrayList<ProjectDTO> list = new ArrayList<ProjectDTO>();
		Connection con = mgr.getConnection();

		String sql = "select * from project where pcaptain=?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, sessionName);
		
		ResultSet rs = ps.executeQuery();
		
		ProjectDTO dto = null;
		
		while(rs.next()) {
			dto = new ProjectDTO();
			String pname = rs.getString(1);
			int pscale = rs.getInt(2);
			int pnom = rs.getInt(3);
			int startdate = rs.getInt(4);
			int duedate = rs.getInt(5);
			String pdescription = rs.getString(6);
			String pcaptain = rs.getString(7);
			
			dto.setPname(pname);
			dto.setPscale(pscale);
			dto.setPnom(pnom);
			dto.setStartdate(startdate);
			dto.setDuedate(duedate);
			dto.setPdescription(pdescription);
			dto.setPcaptain(pcaptain);
			list.add(dto);
		}
		
		mgr.freeConnection(con, ps, rs);
		
		return list;

	}

	
	
}