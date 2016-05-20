package edu.uta.courses.web;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Created by iMr on 08/03/16.
 */
public class DeleteProjectForm {
    @NotEmpty
    private Long projectId;

    public Long getProjectId() {
        return this.projectId;
    }

    public void setProjectId(Long id) {
        this.projectId = id;
    }

}
