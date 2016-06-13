package edu.uta.courses.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by iMr on 31/05/16.
 */
@RestController
@RequestMapping(value = {"/deck"})
public class DeckController {
    public String Deck() {
        System.out.println("helloWorld");
        return "/deck";
    }
}
