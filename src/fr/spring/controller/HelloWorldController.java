package fr.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// ligne pour definir un controller sous spring
@Controller
public class HelloWorldController {
 
	// ligne pour definir l'url de la page (envoi au dispatcher pour la donner a la vue)
    @RequestMapping("/hello")
    public ModelAndView helloWorld() {
 
        String message = "Hello World, Spring 3.0!";
        // argument ModelAndView(la vue "nom".jsp, la ref voulu pour l'objet metier, l'objet metier(MAP))
        return new ModelAndView("hello", "message", message);
    }
}
