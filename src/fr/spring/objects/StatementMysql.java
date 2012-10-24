package fr.spring.objects;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Hashtable;

import fr.spring.model.BDDModel;

public class StatementMysql {
	public static java.sql.Statement stat;
	
	public StatementMysql(){
		
		Connection c = null;    	    	
    	
    	try {
    		
    		// Database type chooser    		
			Class.forName("com.mysql.jdbc.Driver");
			// Connection to database (jdbc:typedb://address/database, "user", "password")
			c = DriverManager.getConnection("jdbc:mysql://localhost/mydatabase","root","");
			// handle on user's action
			
			stat= c.createStatement();
	        // Modeling
	    
			
	    	// ******** //
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error connection : " + e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	
	

}
