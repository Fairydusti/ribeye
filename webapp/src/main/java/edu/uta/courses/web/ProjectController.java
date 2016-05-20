package edu.uta.courses.web;

import edu.uta.courses.repository.ProjectRepository;
import edu.uta.courses.repository.domain.Project;

import edu.uta.courses.service.ProjectsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * Created by MR on 8.3.2016
 * It's a small step for a developers, one giant leap for MRkind
 */

//@Cont kertooo, että halutaan käyttää DI:tä
//DI:n beanm
@Controller
@RequestMapping("/projects")

public class ProjectController {

    //@TODO change this autowired shouldn't be repo in controller
    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    ProjectsService projectsService;

    //Crud
    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public String editProjectsOpen(@ModelAttribute("form") AddProject form, Model model) {

        return "/projects/projects";
    }

    @RequestMapping(value = {"/projects"}, method = RequestMethod.POST)
    public String addProject(@ModelAttribute("form") AddProject form) {
        Project project = new Project();
        project.setProjectName(form.getProjectName());
        project.setProjectDescription(form.getProjectDescription());
        project.setProjectLink(form.getProjectLink());

        projectRepository.create(project);
        return "redirect:/projects/list";
    }
    //cRud
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String projectList(Model model) {
        model.addAttribute("projects", projectsService.getProjects());
        return "/projects/list";
    }
    @RequestMapping(value = "/delete")
    public String deleteProject(@RequestParam("projectId") Long projectId, Model model) {
        Project p = projectsService.findById(projectId);
        projectRepository.delete(p);
        model.addAttribute("projects", projectsService.getProjects());
        return "redirect:/projects/list";
    }

}
