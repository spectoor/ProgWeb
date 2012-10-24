package fr.spring.controller;


import java.util.Collection;
import java.util.Hashtable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import fr.spring.model.BDDModel;
import fr.spring.objects.Membre;
import fr.spring.objects.StatementMysql;


@Controller
@RequestMapping("/finishConnection")
public class finishConnectionController {
	
	// View URL definition
	
			@RequestMapping(method=RequestMethod.POST)
		    public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) {
		 
		    	// Database test   	
		    	BDDModel mesMembres = new BDDModel();
		    	Hashtable<Integer, Membre> model = new Hashtable<Integer, Membre>();		    	
		    					
			        // Modeling
			    //Getting form data
		    	
		    	String login = request.getParameter("login");	    	
		    	String pwd = request.getParameter("pwd");
		    	
		    	
		    	
		    	//Get the country ID
		    	//String query1 = ""
		    	
		    	String query = "select * from membres where Pseudo = \"" + login +"\" && Password = \"" + pwd + "\"";		    	
		    					
				model = mesMembres.BuildModelMembre(query, StatementMysql.stat);			
			    	// ******** //
				
				Collection<Membre> monMembre = model.values();
				Membre profil = new Membre();		
				
				for(Membre m:monMembre){
					profil = m;
				}
				
				if(model.values().isEmpty()==false){
					HttpSession session = request.getSession();				
					session.setAttribute("userName", login);
					session.setAttribute("autorisation",profil.getAdmin());
				}				
								
				

		    	// To the View
		        return new ModelAndView("finishConnection", "bdd", model);
		    }

}
