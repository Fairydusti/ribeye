package edu.uta.courses.repository;

import edu.uta.courses.repository.domain.Project;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by me on 10.2.2015.
 */
@Transactional
public interface ProjectRepository {

    public void update(Project p);

    public void create(Project p);

    public void delete(Project p);

    public Project findById(Long id);

    public List<Project> list();


  /*  public void archive(Project p);



    public User findByUsername(String username);

    public User findByKey(String hashKey);

    public User findById(Long id);


    public List<User> findActiveUsers();

    public List<User> findUsers();

    public Boolean existByUsername(String u);*/

}