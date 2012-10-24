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
@RequestMapping("/finishModifAccount")
public class FinishModifAccountController {
	
	
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
    	String pays = request.getParameter("country");
    	String ville = request.getParameter("city");
    	String email = request.getParameter("email");
    	String tel = request.getParameter("tel");
    	String pwd = request.getParameter("pwd2");
    	String loginSession = (String)request.getSession().getAttribute("userName");
    	
    	System.out.println("pwd= ****************"+pwd + "*************");
    	
    	//Get the country ID
    	    	
    	//UPDATE membres SET Nom = 'Saids', Prenom="Jowel" WHERE Pseudo="";
    	String query = "update membres set Nom = \"" + nom + "\" , Prenom = \"" + prenom + "\", Nom_Pays = \"" + pays + "\" , Nom_Ville = \"" + ville + "\"" +
    			", Email= \"" + email + "\" ,Tel = \"" + tel + "\" Password = \"" + pwd + "\" Where Pseudo = \"" + loginSession + "\" " ;
    	
    	
    	if(pwd.equalsIgnoreCase("")){
    		query = "update membres set Nom = \"" + nom + "\" , Prenom = \"" + prenom + "\", Nom_Pays = \"" + pays + "\" , Nom_Ville = \"" + ville + "\"" +
        			", Email= \"" + email + "\" ,Tel = \"" + tel + "\" Where Pseudo = \"" + loginSession + "\" " ;
        	
    	}
    	
    	sendInscription.executeQ(query, StatementMysql.stat);    	    	
    	
    	
    	System.out.println(query);
    	
	
						
	    	// ******** //

    	// To the View
        return new ModelAndView("finishModifAccount", "bdd", model);
    }

}
