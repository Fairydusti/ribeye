package edu.uta.courses.web;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Created by iMr on 08/03/16.
 */
public class AddProject {

    private Long projectId;

    @NotEmpty
    private String projectName;

    @NotEmpty
    private String projectDescription;

    @NotEmpty
    private String projectLink;


    public Long getProjectId() {
        return this.projectId;
    }

    public void setProjectId(Long id) {
        this.projectId = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectDescription() {
        return projectDescription;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription;
    }

    public String getProjectLink() {
        return projectLink;
    }

    public void setProjectLink(String projectLink) {
        this.projectLink = projectLink;
    }
}