package edu.uta.courses.service;

import edu.uta.courses.repository.domain.Project;

import java.util.List;

/**
 * Created by MR 4.3.2016.
 */
public interface ProjectsService {
    public List<Project> getProjects();
    public Project findById(Long projectId);
    public void updateProject(Project project);
}
