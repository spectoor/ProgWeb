package fr.spring.model;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;
import fr.spring.objects.Annonce;
import fr.spring.objects.Categorie;
import fr.spring.objects.Membre;
import fr.spring.objects.Pays;
import fr.spring.objects.Ville;

public class BDDModel implements IModel{

	@Override
	public Hashtable<Integer, Pays> BuildModelPays(String query, Statement state) {
		// TODO Auto-generated method stub
		
		ResultSet r = null;
    	Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();
    	
    	try {
    		// Execute a query	
			r = state.executeQuery(query);
	    	
			int i = 0;
			// Fill Map (model)
			while(r.next()){
	    		model.put(i, new Pays(r.getInt("Id_Pays"), r.getString("Nom_Pays"),r.getString("Devise")));
	    		i+=1;
	    	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    			
		return model;
		
	}
	

	@Override
	public Hashtable<Integer, Categorie> BuildModelCategorie(String query, Statement state) {
		// TODO Auto-generated method stub
		
		ResultSet r = null;
		ResultSet r2 = null;
    	Hashtable<Integer, Categorie> model = new Hashtable<Integer,Categorie>();
    	java.sql.Connection c2;
    	java.sql.Statement state2 = null;
    	
    	
    	
    	//second connection with the database
		try {
			
			c2 = DriverManager.getConnection("jdbc:mysql://localhost/mydatabase","root","toor");
			state2 = c2.createStatement();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
    	
    	
    	try {
    		// Execute a query	
			r = state.executeQuery(query);
	    	
			int i = 0;
			// Fill Map (model)
			while(r.next()){
				
				//recuperation de la categorie dans la base de données
				Categorie cat = new Categorie(r.getInt("Id_Categorie"), r.getString("Nom_Categorie"));
				String name = r.getString("Nom_Categorie");
							
				//recuperation des sous categories associées
				String q =  "select Id_Categoriespec, Intitule from categoriespec where Nom_Categorie = " + "\""+ name + "\"";
				r2 = state2.executeQuery(q);				
				
				while(r2.next()){					
					cat.sousCategorie.add(new Categorie(r2.getInt("Id_Categoriespec"), r2.getString("Intitule")));					
				}
								
	    		model.put(i, cat);
	    		i+=1;
	    		
	    	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    			
		return model;
		
	}
	
	
	
	@Override
	public Hashtable<Integer, Annonce> BuildModelAnnonce(String query, Statement state) {
		// TODO Auto-generated method stub
		
		ResultSet r = null;
		
    	Hashtable<Integer, Annonce> model = new Hashtable<Integer,Annonce>();
   	

    	try {
    		// Execute a query	
			r = state.executeQuery(query);
	    	
			int i = 0;
			// Fill Map (model)
			while(r.next()){
	    		model.put(i, new Annonce(r.getInt("Id_Annonce"),r.getString("Nom_Categorie"),r.getString("Nom_Pays"),
	    				r.getString("Nom_Ville"),r.getString("Login_Membre"),r.getString("Nom_Auteur"),r.getString("Prenom_Auteur"),
	    				r.getString("Tel_Auteur"),r.getString("Email_Auteur"),r.getString("Publication"),
	    				r.getString("Titre"),r.getString("Description"),r.getInt("Prix"),r.getInt("Pro"),r.getInt("Checked")));
	    				
	    		i+=1;
	    	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		
		return model;
		
	}
	
	
	@Override
	public Hashtable<Integer, Membre> BuildModelMembre(String query, Statement state) {
		// TODO Auto-generated method stub
		
		ResultSet r = null;
		
    	Hashtable<Integer, Membre> model = new Hashtable<Integer,Membre>();
   	

    	try {
    		// Execute a query	
			r = state.executeQuery(query);
	    	
			int i = 0;
			// Fill Map (model)
			while(r.next()){
				
				
				model.put(i, new Membre(r.getInt("Id_Membre"),r.getString("Nom_Pays"), r.getString("Nom_Ville"),
	    			r.getString("Nom"),r.getString("Prenom"),r.getString("Pseudo"),r.getString("Birth"),r.getString("Email"),
	    			r.getString("Tel"),r.getString("Password"),r.getString("Type"),r.getString("Autorisation")));
									
	    		i+=1;
	    	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		
		return model;
		
	}
	
	public Hashtable<Integer, Ville> BuildModelVille(String query, Statement state) {
		// TODO Auto-generated method stub
		
		ResultSet r = null;
		
    	Hashtable<Integer, Ville> model = new Hashtable<Integer,Ville>();
   	

    	try {
    		// Execute a query	
			r = state.executeQuery(query);
	    	
			int i = 0;
			// Fill Map (model)
			while(r.next()){
								
				model.put(i, new Ville(r.getInt("Id_Ville"),r.getString("Nom_Ville"), r.getString("Nom_Pays")));									
	    		i+=1;
	    	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    			
		return model;
		
	}
	
	
	

}
