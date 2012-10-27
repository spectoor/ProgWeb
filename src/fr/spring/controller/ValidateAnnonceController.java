package fr.spring.controller;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import fr.spring.model.SendQueryModel;
import fr.spring.objects.Pays;
import fr.spring.objects.StatementMysql;

@Controller
public class ValidateAnnonceController {
	
	// View URL definition	
		@RequestMapping("/validateAnnonce")
	    public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) {
	 
	    	// Database test   	
	    	SendQueryModel sendInscription = new SendQueryModel();
	    	Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();
	    	
	    					
		        // Modeling
		    //Getting form data
	    	
	    	String id = request.getParameter("id");
	    	int idAnnnonce = Integer.parseInt(id);
	    	
	    	//UPDATE membres SET Nom = 'Saids', Prenom="Jowel" WHERE Pseudo="";
	    	String query = "update annonces set Checked = 1 where Id_Annonce=" + idAnnnonce;
	    		    	
	    	System.out.println(query);
	    		
	    	String auth = (String) request.getSession().getAttribute("autorisation");
	    	
	    	// check the session permission before validate the annonce
	    	if(auth.equalsIgnoreCase("admin"))
	    		sendInscription.executeQ(query, StatementMysql.stat);				
		    	// ******** //

	    	// To the View
	        return new ModelAndView("validateAnnonce", "bdd", model);
	    }


}
