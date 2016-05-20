package edu.uta.courses.repository.domain;

import org.joda.time.DateTime;
import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name ="project")
public class Project implements Serializable {
    @Id
    @GeneratedValue
    @Column
    private Long projectId;

    @Column(nullable = false, length =20, updatable=true)
    private String projectName;

    @Column(nullable = false)
    private String projectDescription;

    @Column(nullable = true)
    private String projectLink;

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

    public void setProjectLink(String projectLink) {
        if(projectLink != null || projectLink != "") {
            this.projectLink = projectLink;
        }

    }
    public String getProjectLink() {
        return this.projectLink;
    }

}
