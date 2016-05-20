'use strict';
 
projectApp.factory('ProjectService', ['$http', '$q', function($http, $q){
 
    return {
         
            fetchAllProjects: function() {
                    return $http.get('http://localhost:8080/projects/restlist')
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching projects');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             createProject: function(project){
                    return $http.post('http://localhost:8080/projects/create', project)//?projectName='+projectForm.projectName)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while creating project');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
            updateProject: function(project, projectId){
                    console.log(project);
                    return $http.put('http://localhost:8080/projects/update?projectId='+projectId, project)
                            .then(
                                    function(response){
                                        return response.data;
                                        console.log('Project with id: '+ projectId + ' updated');
                                    }, 
                                    function(errResponse){
                                        console.error('Error while updating project');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
            deleteProject: function(id){
                    return $http.get('http://localhost:8080/projects/delete?projectId='+id)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while deleting project (service');
                                        return $q.reject(errResponse);
                                    }
                            );
            }
        };
}]);
