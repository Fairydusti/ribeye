package edu.uta.courses.repository.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

//import org.joda.time.DateTime;

/**
 * Created by iMr on 15/03/16.
 */

public class UiProject {

    private Long projectId;

    private String projectName;

    private String projectDescription;

    public Long getProjectId() {
        return this.projectId;
    }

    public void setProjectId(Long id) {
        this.projectId = id;
    }

    public String getProjectName() {
        return this.projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }
    public String getProjectDescription() {
        return this.projectDescription;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription;
    }

    public UiProject(){}

    public UiProject(Project p){
        this.setProjectId(p.getProjectId());
        this.setProjectName(p.getProjectName());
        this.setProjectDescription(p.getProjectDescription());
    }
}
