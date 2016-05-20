package edu.uta.courses.service.impl;

import edu.uta.courses.service.ProjectsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.uta.courses.repository.ProjectRepository;
import edu.uta.courses.repository.domain.Project;

import java.util.List;

/**
 * Created by me on 27.1.2015.
 */
@Service("ProjectsService")
public class ProjectsServiceImpl implements ProjectsService {

    @Autowired ProjectRepository projectRepository;

    @Override
    public List<Project> getProjects(){
        return projectRepository.list();
    }

    public Project findById(Long projectId) {
        Project p = projectRepository.findById(projectId);
        return p;
    }
    public void updateProject(Project project){
        projectRepository.update(project);
    }

}
