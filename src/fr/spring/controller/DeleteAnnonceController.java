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
public class DeleteAnnonceController {
		
	// View URL definition	
	@RequestMapping("/deleteAnnonce")
    public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) {
 
    	// Database test   	
    	SendQueryModel sendInscription = new SendQueryModel();
    	Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();
    	
    					
	        // Modeling
	    //Getting form data
    	
    	String id = request.getParameter("id");
    	int idAnnnonce = Integer.parseInt(id);
    	
    	String query = "delete from annonces where Id_Annonce=" + idAnnnonce; 
    	
    	
    	System.out.println(query);
    	
	
		sendInscription.executeQ(query, StatementMysql.stat);				
	    	// ******** //

    	// To the View
        return new ModelAndView("deleteAnnonce", "bdd", model);
    }

}
