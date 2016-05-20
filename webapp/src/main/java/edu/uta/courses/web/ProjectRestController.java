package edu.uta.courses.web;

import java.util.List;

import edu.uta.courses.repository.domain.Project;
import edu.uta.courses.service.ProjectsService;
import edu.uta.courses.repository.ProjectRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.util.UriComponentsBuilder;


/**
 * Created by MR on 17.5.2016
 */

//@Cont kertooo, että halutaan käyttää DI:tä
//DI:n beanm
@RestController
@RequestMapping("/projects")

public class ProjectRestController {

    //@TODO change this autowired
    //@Autowired
    //ProjectRepository projectRepository;

    @Autowired
    ProjectsService projectsService;

    @Autowired
    ProjectRepository projectRepository;

    /*--- cRud ----*/
    @RequestMapping(value = "/restlist", method = RequestMethod.GET)
    public ResponseEntity<List<Project>> projectList() {
        List<Project> projects = projectsService.getProjects();
        return new ResponseEntity<List<Project>>(projects, HttpStatus.OK);

    }
    /*--- crUd ----*/
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public ResponseEntity<Project> updateProject(@ModelAttribute("projectId") Long projectId, @RequestBody Project project) {
        System.out.println("Updating Project " + projectId);

        Project currentProject = projectsService.findById(projectId);

        if (currentProject==null) {
            System.out.println("Project with id " + projectId + " not found");
            return new ResponseEntity<Project>(HttpStatus.NOT_FOUND);
        }

        currentProject.setProjectName(project.getProjectName());
        currentProject.setProjectDescription(project.getProjectDescription());
        currentProject.setProjectLink(project.getProjectLink());

        projectsService.updateProject(currentProject);
        return new ResponseEntity<Project>(currentProject, HttpStatus.OK);
    }
    /*--- cruD ----*/
  @RequestMapping(value = "/delete", method = RequestMethod.GET)
  public ResponseEntity<List<Project>> deleteProject(@RequestParam("projectId") Long projectId) {
      System.out.println("Fetching & Deleting Project with id " + projectId);

      Project project = projectsService.findById(projectId);
      if (project == null) {
          System.out.println("Unable to delete. Project with id " + projectId + " not found");
      }
        //Should be service
      projectRepository.delete(project);
      List<Project> projects = projectsService.getProjects();
      return new ResponseEntity<List<Project>>(projects, HttpStatus.OK);

  }
    /*--- Crud ----*/

    @RequestMapping(value = "/create", method = RequestMethod.POST, produces={"application/json;charset=UTF-8"})
    public ResponseEntity<Void> createProject(@RequestBody AddProject projectForm,  UriComponentsBuilder ucBuilder) {
        Project project = new Project();
        project.setProjectName(projectForm.getProjectName());
        project.setProjectDescription(projectForm.getProjectDescription());
        project.setProjectLink(projectForm.getProjectLink());
        //Should be service
        projectRepository.create(project);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/create").buildAndExpand(project.getProjectId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

    }


}
