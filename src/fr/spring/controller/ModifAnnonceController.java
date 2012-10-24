package fr.spring.controller;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import fr.spring.model.BDDModel;
import fr.spring.objects.Annonce;
import fr.spring.objects.Pays;
import fr.spring.objects.StatementMysql;

@Controller
public class ModifAnnonceController {
	
	 @RequestMapping("/modifAnnonce")
	    public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse response) {
	 
	    	// Database test 
	    	BDDModel mesPays = new BDDModel();	    
	    	BDDModel mesAnnonces = new BDDModel();
	    	
	    	Hashtable<String , Object> model = new Hashtable<String,Object>();
	    	Hashtable<Integer,Annonce> modelAnnonce = new Hashtable<Integer,Annonce>();
	    	Hashtable<Integer, Pays> modelPays = new Hashtable<Integer, Pays>();
	    	
	    	String id = request.getParameter("id");	    	
	    	int idAnnonce = Integer.parseInt(id);
	    	
	    	String query = "select * from annonces where Id_annonce = " + idAnnonce;	    		         				
			modelAnnonce = mesAnnonces.BuildModelAnnonce(query,StatementMysql.stat);
			
			query ="select * from pays order by Nom_Pays desc" ; 
			modelPays = mesPays.BuildModelPays(query, StatementMysql.stat);
			
			model.put("pays", modelPays);
			model.put("annonces", modelAnnonce);
			
	    	
			// ******** //
	
	 
	    	// To the View
	        return new ModelAndView("modifAnnonce", "bdd", model);
      
	    }


}
