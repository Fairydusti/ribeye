package edu.uta.courses.web;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Created by iMr on 13/06/16.
 */
public class AccountEditForm {
    @NotEmpty
    private String userName;

    @NotEmpty
    private Long userId;

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return this.userId;
    }

}
