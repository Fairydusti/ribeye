'use strict';

projectApp.controller('ProjectController', ['$scope', 'ProjectService', function($scope, ProjectService) {
          
          var self = this;
          self.project={projectId:null,projectName:'',projectDescription:'',projectLink:''};
          self.projects=[];
               
          self.fetchAllProjects = function(){
              ProjectService.fetchAllProjects()
                .then(
                   function(d) {
                        self.projects = d;
                   },
                    function(errResponse){
                        console.error('Error while fetching Projects');
                    }
                 );
          };
           self.createProject = function(project){
              ProjectService.createProject(project)
                      .then(
                      self.fetchAllProjects, 
                              function(errResponse){
                                   console.error('Error while creating Project.');
                              } 
                  );
          };
          self.updateProject= function(project, projectId){
              console.log("Update Project ctrl");
              ProjectService.updateProject(project, projectId)
                      .then(
                              self.fetchAllProjects, 
                              function(errResponse){
                                   console.error('Error while updating project.');
                              } 
                  );
          };
           self.deleteProject = function(id){
            ProjectService.deleteProject(id)
                    .then(
                            self.fetchAllProjects, 
                            function(errResponse){
                                 console.error('Error while deleting project.');
                            } 
                );
          };

          self.fetchAllProjects();
          self.submit = function() {
              if(self.project.projectId === null){
                  console.log('Saving New project', self.project);    
                  self.createProject(self.project);
              }else{
                  console.log("Updating project");
                  self.updateProject(self.project, self.project.projectId);
              }
              self.reset();
          };
          self.remove = function(id){
              console.log('id to be deleted', id);
              if(self.project.id === id) {//clean form if the project to be deleted is shown there.
                 self.reset();
              }
              self.deleteProject(id);
          };
          self.reset = function(){
            console.log('RESET ');
              self.project ={projectId:null, projectName:'', projectDescription:'', projectLink:''};
              $scope.projectForm.$setPristine(); //reset Form
          };
          self.edit = function(projectId){
              console.log('id to be edited: ', projectId);
              for(var i = 0; i < self.projects.length; i++){
                  if(self.projects[i].projectId === projectId) {
                     self.project = angular.copy(self.projects[i]);
                     break;
                  }
              }
          };


  }]);