package fr.spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;

import fr.spring.objects.Contact;

public class BDDModel implements IModel{

	@Override
	public Hashtable<Integer, Contact> BuildModel(String query, Statement state) {
		// TODO Auto-generated method stub

    	ResultSet r = null;
    	Hashtable<Integer, Contact> model = new Hashtable<>();
    	
    	try {
    		// Execute a query	
			r = state.executeQuery(query);
	    	
			int i = 0;
			// Fill Map (model)
			while(r.next()){
	    		model.put(i, new Contact(r.getString("Nom"), r.getString("Prenom"), r.getString("Mail")));
	    		i+=1;
	    	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	

		
		return model;
	}

}
