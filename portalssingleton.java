package com.vds;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.TimeUnit;
public class PortalsSingleton {
	static PortalsSingleton obj = new PortalsSingleton();
	private Statement st = null;
	private PortalsSingleton(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vds","root","1671");
			st = con.createStatement();
			
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	public static PortalsSingleton getInstance() {
		return obj;
	}
	
	public void testDb() {
		System.out.println("Testing db connection and listing tables");
		try {
			ResultSet rs = st.executeQuery("SHOW TABLES;");
			while(rs.next()) {
				System.out.println(rs.getString("Tables_in_vds"));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public ResultSet login(String email,String password) {
		String querry;
		if(email.indexOf('@') == -1) {
			querry = "SELECT * FROM users WHERE phone_number = '"+email+"' AND password_hash = '"+password+"';" ;
		}else {
			querry = "SELECT * FROM users WHERE email = '"+email+"' AND password_hash = '"+password+"';" ;
		}
		
		System.out.println(querry);
		try {
			return st.executeQuery(querry);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
		
	}
	
	public void register(String username,String pass,String email,String role,String phone_number) {
		String querry = String.format("INSERT INTO users (username, password_hash, email, role, phone_number) VALUES ('%s', '%s', '%s', '%s', '%s');"
				,username, pass, email, role, phone_number);
		System.out.println(querry);
		try {
			 int rows = st.executeUpdate(querry);
			 if(rows != 0) {
				 System.out.println("User Added");
			 }
		} catch (SQLException e) {
			System.out.println(e);
		}
		
	}
	
	public ResultSet get_allusers() {
		String querry = "select * from users";
		System.out.println(querry);
		try {
			return st.executeQuery(querry);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public ResultSet get_allprobs() {
		String querry = "select * from problems";
		System.out.println(querry);
		try {
			return st.executeQuery(querry);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public ResultSet get_sectors() {
		String querry = "select * from sectors";
		System.out.println(querry);
		try {
			return st.executeQuery(querry);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public ResultSet get_allschemes() {
		String querry = "select * from schemes";
		System.out.println(querry);
		try {
			return st.executeQuery(querry);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public ResultSet get_allevents() {
		String querry = "select * from events";
		System.out.println(querry);
		try {
			return st.executeQuery(querry);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public void add_problem(String sector,String user_id,String status, String desc) {
		String querry = String.format("INSERT INTO problems (problem_owner, problem_sector, is_resolved,problem_description) VALUES('%s', '%s', %s,\"%s\");"
				,user_id,sector,status,desc);
		System.out.println(querry);
		try {
			 int rows = st.executeUpdate(querry);
			 if(rows != 0) {
				 System.out.println("PROBLEM Added");
			 }
		} catch (SQLException e) {
			System.out.println(e);
		}
		
	}
	public void add_scheme(String scheme_description, String scheme_name, String owner_id, String event_id,String problem_ids) {
		String querry = String.format("INSERT INTO schemes (scheme_description, scheme_name, owner_id, event_id,problem_ids)VALUES ('%s', '%s', %s, %s,'%s');",
				scheme_description,scheme_name,owner_id,event_id,problem_ids);
		System.out.println(querry);
		try {
			 int rows = st.executeUpdate(querry);
			 if(rows != 0) {
				 System.out.println("PROBLEM Added");
			 }
		} catch (SQLException e) {
			System.out.println(e);
		}
		
	}
	
	
	
	public void add_event(String event_name,String event_date, String event_place,String organizer_id) {
		String querry = String.format("INSERT INTO events (event_name, event_date, event_place, organizer_id)VALUES ('%s', '%s', '%s', %s);",
				event_name,event_date,event_place,organizer_id);
		System.out.println(querry);
		try {
			 int rows = st.executeUpdate(querry);
			 if(rows != 0) {
				 System.out.println("PROBLEM Added");
			 }
		} catch (SQLException e) {
			System.out.println(e);
		}
		
	}
	
	public String get_user_id(String email) {
		System.out.println(email);
		try {
			String querry = String.format("SELECT id from users WHERE email = '%s';",email);
			System.out.println(querry);
			ResultSet rs = st.executeQuery(querry);
			TimeUnit.SECONDS.sleep(1);
			if(rs.next()) {
				System.out.println(rs.getString("id"));
				
				return rs.getString("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	
}
