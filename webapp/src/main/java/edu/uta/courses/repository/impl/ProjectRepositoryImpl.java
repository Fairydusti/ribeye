package edu.uta.courses.repository.impl;

import edu.uta.courses.repository.ProjectRepository;
import edu.uta.courses.repository.domain.Project;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
/**
 * Created by iMr on 08/03/16.
 */
@Repository("projectRepository")
public class ProjectRepositoryImpl implements ProjectRepository{

    Logger log = Logger.getLogger(ProjectRepositoryImpl.class.getName());


    @PersistenceContext(name = "entityManager")
    EntityManager em;

    public void update(Project p){
        em.merge(p);
        if (log.isDebugEnabled()) log.debug("Merged project");

    }
    @Override
    public void create(Project p){
        em.persist(p);
        if (log.isDebugEnabled()) log.debug("Persisted project");

    }
    @Override
    public void delete(Project p){
        if (log.isDebugEnabled()) log.debug("Remove Project ("+ p.getProjectId() +")");
        Project p2 = findById(p.getProjectId());
        if(p2.getProjectId() != null) {
            em.remove(p2);
            p.setProjectId(null);
        }

    }
    @Override
    public Project findById(Long id) {
        if (log.isDebugEnabled()) log.debug("Find By Id: " + id);
        return em.find(Project.class, id);
    }

    @Override
    public List<Project> list(){
    if (log.isDebugEnabled()) log.debug("findProjects()");
            return em.createQuery("SELECT u FROM Project u", Project.class)
                    .getResultList();
    }


/*    public void archive(Project p){

    }*/
}
