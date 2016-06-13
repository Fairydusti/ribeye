<%@ include file="../../init.jspf" %>


<h1>List of all projects</h1>

<%--<table class ="table table-responsive table-striped">
<tr><th>Id</th><th>Name</th><th>description</th><th></th><th></th><th></th></tr>
<c:forEach items="${projects}" var="project" >
<tr>
    <td>${project.projectId}</td>
    <td class ="project-details">${project.projectName}</td>
    <td class ="project-details">${project.projectDescription}</td>
    <td class ="project-details"><a href="${project.projectLink}" target="_blank">Link</a></td>
     <security:authorize if=hasAnyRole('ROLE_ADMIN')> 
    <td>
      <spring:url value="/projects/delete?projectId=${project.projectId}" var="deleteProjectUrl"/>
        <a class="btn btn-danger" href="${deleteProjectUrl}">Delete</a>
    </td>
        <td>
      <spring:url value="/projects/update?projectId=${project.projectId}" var="updateUrl"/>

        <button class="btn btn-default update-project" src="${updateUrl}">Update </button>
    </td>
</tr>

</c:forEach>
</table>


        <spring:url value="/projects/projects" var="addProjectUrl" htmlEscape="true"/>
            <a class="btn btn-default" href="${addProjectUrl}">Add Project <span class="glyphicon glyphicon-plus"></span></a>--%>
<!--{{ firstName + " " + lastName }}
<h3>Angular table from JSON array</h3>
    <table class ="table table-responsive table-striped">
        <tr><th ng-repeat="(key, val) in projects[0]">{{key}}</th></tr>
        <tr ng-repeat="item in projects">
        <td ng-repeat="(key, val) in item">{{val}}</td>
        </tr>
    </table>
 </div>
<br>
<br>
<div style="height:10em; color:black;"></div>

<script type="text/javascript" src="../resources/js/projectApp.js"></script>-->
<div ng-app="projectApp" class="ng-cloak" ng-controller="ProjectController as ctrl">
<!--{{ firstName + " " + lastName }}-->
<h3>Rest table</h3>
            <table class="table table-hover" id="projectTable">
            <thead>
              <tr>
                  <th>ID.</th>
                  <th>Name</th>
                  <th>Description</th>
                  <th>Link</th>
                  <%--<th width="20%"></th>--%>
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="p in ctrl.projects">
                  <td><span ng-bind="p.projectId"></span></td>
                  <td><span ng-bind="p.projectName"></span></td>
                  <td><span ng-bind="p.projectDescription"></span></td>
                  <td><a ng-href="{{p.projectLink}}"><span ng-bind="p.projectLink"></span></a></td>
                  <td>
                  <button type="button" ng-click="ctrl.edit(p.projectId)" class="btn btn-success custom-width"
                  data-toggle="" data-target="#addProject-field">Edit</button> 

                  <button type="button" ng-click="ctrl.remove(p.projectId)" class="btn btn-danger custom-width">Remove</button>
                  </td>
              </tr>
            </tbody>
            </table>
            <div id="addProject-field" class ="panel">
                  <form  ng-submit="ctrl.submit()" name="projectForm" class="form-horizontal" id="projectForm">
                      <div class="row">
                          <div class="form-group col-md-12">
                            <input type="hidden" ng-model="ctrl.project.projectId" />
                              <label class="col-md-2 control-lable" for="projectName">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.project.projectName" id="projectName" class="projectName form-control input-sm" placeholder="Enter project name" required ng-minlength="1" ng-maxlength='20'/>
                                  <div class="has-error" ng-show="projectForm.$dirty">
                                      <span ng-show="projectForm.projectName.$error.required">This is a required field</span>
                                      <span ng-show="projectForm.projectName.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="projectForm.projectName.$error.maxlength">Minimum length required is 20</span>
                                      <span ng-show="projectForm.projectName.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="projectDescription">Project Description</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.project.projectDescription" id="projectDescription" class="form-control input-sm" placeholder="Description. [This field is validation free]" required/>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="projectLink">Link</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.project.projectLink" id="projectLink" class="link form-control input-sm" placeholder="Enter project link"/>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="projectForm.$pristine">Reset Form</button>
                              <input type="submit"  value="{{!ctrl.project.projectId ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="projectForm.$invalid">
                          </div>
                      </div>
                  </form>
            </div>
            <div><button class="btn btn-default"  ng-click="ctrl.reset()" data-toggle="" data-target="#addProject-field"><span class="glyphicon glyphicon-plus"></span> Add project</button>
          </div>
<br>
<br>
<div style="height:10em; color:black;"></div>
          <div class ="project-container">
              <div ng-repeat="p in ctrl.projects" class ="project-field">
                  <div class="project-header">
                    <h2 ng-bind="p.projectName"></h2>
                    <a ng-href="{{p.projectLink}}"><span ng-bind="p.projectLink"></span></a>
                </div>

                  <div><span ng-bind="p.projectDescription"></span></div>
                  <div class="admin-tools">
                  <button type="button" ng-click="ctrl.edit(p.projectId)" class="btn btn-success custom-width"
                  data-toggle="" data-target="#addProject-field">Edit</button> 
<!-- <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-modal-{{p.projectId}}">
Remove </button> -->
                  <button type="button" ng-click="ctrl.remove(p.projectId)" class="btn btn-danger custom-width">Remove</button>
                  <%-- Modal for removing project  
                        <div class="modal fade" id="delete-modal-{{p.projectId}}" tabindex="-1" role="dialog">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Are you sure you want to delete {{p.projectName}} -project?</h4>
                              </div>

                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" ng-click="ctrl.remove(p.projectId)" data-dismiss="#delete-modal-{{p.projectId}}" class="btn btn-danger">Remove</button>
                              </div>
                            </div><!-- /.modal-content -->
                          </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->--%>
                  </div>
              </div>
          </div>
<script type="text/javascript" src="../resources/js/projectApp.js"></script>
<script type="text/javascript" src="../resources/js/projectController.js"></script>
<script type="text/javascript" src="../resources/js/projectService.js"></script>
</div>


