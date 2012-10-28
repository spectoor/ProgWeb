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
@RequestMapping("/finishModifAnnonce")
public class FinishModifAnnonceController {
	
	
	// View URL definition
	
	@RequestMapping(method=RequestMethod.POST)
    public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) {
 
    	// Database test   	
    	SendQueryModel sendInscription = new SendQueryModel();
    	Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();
    	
    					
	        // Modeling
	    //Getting form data
    	
    	String nom = request.getParameter("nom");
    	String prenom = request.getParameter("prenom");
    	String email = request.getParameter("email");
    	String tel = request.getParameter("tel");    	
    	  	
    	String titre = request.getParameter("titre");
    	String description = request.getParameter("description");   	
    	
    	int idAnnonce = Integer.parseInt(request.getParameter("idAnnonce"));
    	int prix = Integer.parseInt(request.getParameter("prix"));
    				    
    	
    
    	String query = "update annonces set Nom_Auteur = \"" + nom + "\" , Prenom_Auteur = \"" + prenom + "\"" +
    			", Email_Auteur= \"" + email + "\" , Tel_Auteur = \"" + tel +"\" ,Titre = \"" + titre + "\" , Description = \"" + description +
    			"\" ,  Prix = " + prix + ", Checked = 0 Where Id_Annonce = " + idAnnonce;
    	
  
    	System.out.println(query);
    	
		
		sendInscription.executeQ(query, StatementMysql.stat);				
	    // ******** //

    	// To the View
        return new ModelAndView("finishModifAnnonce", "bdd", model);
    }

	

}
