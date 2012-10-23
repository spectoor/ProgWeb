package fr.spring.model;


import java.sql.SQLException;
import java.sql.Statement;


public class SendQueryModel {
	
	public boolean executeQ(String query, Statement state) {
		// TODO Auto-generated method stub
		
		   	
    	try {
    		// Execute a query	
			//r = state.executeQuery(query);
			state.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	
		
		return true;
		
	}

}
