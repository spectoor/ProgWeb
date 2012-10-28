package fr.spring.controller;

import java.util.Hashtable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import fr.spring.objects.Pays;


@Controller
public class DeconnectController {

	// View URL definition	
	@RequestMapping("/deconnect")
    public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) {
 
    	// Database test   	    	
    	Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();
    	    					
	   //disable the session
    	request.getSession().invalidate();    
    	
    	// To the View
        return new ModelAndView("deconnect", "bdd", model);
    }
}
