package fr.spring.controller;


import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import fr.spring.objects.Pays;

@Controller
public class ConnectionController {
	
	// View URL definition
    @RequestMapping("/connection")
    public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse response) {
 
    	// Database test    	    	
    	Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();
    				
        // Modeling
    							
 
    	//To the View
        return new ModelAndView("connection", "bdd", model);
    }

}
