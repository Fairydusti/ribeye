package edu.uta.courses.web;

import edu.uta.courses.repository.PersonRepository;
import edu.uta.courses.repository.domain.Constants;
import edu.uta.courses.repository.domain.User;
import edu.uta.courses.repository.domain.WwwUser;
import edu.uta.courses.util.UserUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created by me on 21.2.2015.
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    Logger logger = Logger.getLogger(AccountController.class.getName());

    @Autowired
    PersonRepository personRepository;


    @RequestMapping( value = {"/", ""})
    public String account(@ModelAttribute("form") AccountEditForm form, Model model) {
        model.addAttribute("account", "");
        // can not do this anymore! User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails user = (UserDetails) auth.getPrincipal();
            name = user.getUsername();
        } else {
            // User is actually anonymous, so is not logged in.
            name = (String)auth.getPrincipal();
        }

        // OR check if the user is instance if WwwUser...?
        try {
            WwwUser wUser = UserUtil.getWwwUser();
        } catch (Exception e) {
          /* no op BUT REMEMBER, there is static user service too, those ARE instances of
           org.springframework.security.core.userdetails.User
           */
            logger.error("Trying to get WwwUser but the user is not such user?");
        }
         //get logged in username

        model.addAttribute("username", name);
        return "account";
    }
    @RequestMapping(value={"/update"}, method= RequestMethod.GET)
    public String updateAccountGet(@ModelAttribute("form") AccountEditForm form, Model model){
            String name ="";
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (!(auth instanceof AnonymousAuthenticationToken)) {
                UserDetails user = (UserDetails) auth.getPrincipal();
                name = user.getUsername();
            } else {
                // User is actually anonymous, so is not logged in.
                name = (String)auth.getPrincipal();
            }

        try {
                WwwUser wUser = UserUtil.getWwwUser();
                form.setUserName(wUser.getUsername());
            } catch (Exception e) {
              /* no op BUT REMEMBER, there is static user service too, those ARE instances of
               org.springframework.security.core.userdetails.User
               */
                logger.error("Trying to get WwwUser but the user is not such user?");
            }
            model.addAttribute("user", personRepository.findByUsername(name));
        return "/account/update";
    }

    @RequestMapping( value = "/update", method = RequestMethod.POST)
    public String changeAccount( @ModelAttribute("form") AccountEditForm form, Model model) {
        String name;
        String errormessage;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails user = (UserDetails) auth.getPrincipal();
            name = form.getUserName();
        } else {
            // User is actually anonymous, so is not logged in.
            name = (String)auth.getPrincipal();
            errormessage = "You are not user: " + name;
            return errormessage;
        }

        // OR check if the user is instance if WwwUser...?
        try {
          /*Short cut for updating own username*/
            //  WwwUser wUser = UserUtil.getWwwUser();
            Long uId = form.getUserId();
            User user = personRepository.findById(uId);
            user.setUserName(form.getUserName());
            personRepository.update(user);
        } catch (Exception e) {
          /* no op BUT REMEMBER, there is static user service too, those ARE instances of
           org.springframework.security.core.userdetails.User
           */
            logger.error("Trying to get WwwUser but the user is not such user?");
        }
        return "redirect:/account";

    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String accountList(Model model) {
        model.addAttribute("users", personRepository.findUsers());
        return "/account/list";
    }

    @RequestMapping(value = {"/assignrole/{uid}/{role}"}, method = RequestMethod.GET)
    public String editPersonCommit(@PathVariable("uid") Long uid, @PathVariable("role") String role, Model model) {
        User u = personRepository.findById(uid);
        //WwwUser wwwUser = new WwwUser(u);
        u.setSecurityRoles(role);
        personRepository.update(u);
        model.addAttribute("updatedUser", u);
        model.addAttribute("users", personRepository.findUsers());
        return "/account/list";
    }



}
