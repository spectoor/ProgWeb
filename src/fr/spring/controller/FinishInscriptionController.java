package fr.spring.controller;

import java.util.Hashtable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import fr.spring.model.SendQueryModel;
import fr.spring.objects.Pays;
import fr.spring.objects.StatementMysql;

@Controller
@RequestMapping("/finishInscription")
public class FinishInscriptionController {
	
	// View URL definition
	
		@RequestMapping(method=RequestMethod.GET)
	    public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) {
	 
	    	// Database test   	
	    	SendQueryModel sendInscription = new SendQueryModel();
	    	Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();
	    	
	    					
		        // Modeling
		    //Getting form data
	    	
	    	String nom = request.getParameter("nom");
	    	String prenom = request.getParameter("prenom");
	    	String pseudo = request.getParameter("login");
	    	String pays = request.getParameter("country");
	    	String date = request.getParameter("birth");
	    	String email = request.getParameter("email");
	    	String pwd = request.getParameter("pwd1");
	    	
	    	
	    	
	    	//Get the country ID
	    	//String query1 = ""
	    	
	    	
	    	String query = "insert into membres (Nom_Pays,Nom,Prenom,Pseudo,Birth,Email,Password) VALUES " +
			"(\"" + pays +"\",\""+ nom +"\",\""+ prenom +"\",\""+ pseudo +"\",\""+ date +"\",\""+ email +"\",\""+ pwd + "\")" ;
	    	
	    	System.out.println(query);
	    	
			//insert into membre ("Id_Membre","Id_Pays" , "Nom" , "Prenom" , "Pseudo" , "Birth" , "Email" , "Password" )
	    	//VALUES ("", "", "" , "" , "", "", "");
	    	
			sendInscription.executeQ(query, StatementMysql.stat);				
		    	// ******** //

	    	// To the View
	        return new ModelAndView("finishInscription", "bdd", model);
	    }

}
