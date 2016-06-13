package edu.uta.courses.web;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Created by iMr on 13/06/16.
 */
public class AccountEditForm {
    @NotEmpty
    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

}
