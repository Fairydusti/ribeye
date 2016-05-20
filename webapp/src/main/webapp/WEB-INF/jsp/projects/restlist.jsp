<%@ include file="../../init.jspf" %>


<h1>List of all projects</h1>

<%--
<div ng-app="projectApp" ng-controller="ProjectController as ctrl">
<h3>Rest table</h3>
            <table class="table table-hover">
            <thead>
              <tr>
                  <th>ID.</th>
                  <th>Name</th>
                  <th>Description</th>
                  <th>Link</th>
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="p in ctrl.projects">
                  <td><span ng-bind="p.projectId"></span></td>
                  <td><span ng-bind="p.projectName"></span></td>
                  <td><span ng-bind="p.projectDescription"></span></td>
                  <td><span ng-bind="p.projectLink"></span></td>
                </tr>
            </tbody>
            </table>
       </div>
<br>
<br> --%>
<div style="height:10em; color:black;"></div>

<!-- <script type="text/javascript" src="../resources/js/projectApp.js"></script>
 -->


<%--<table class ="table table-responsive table-striped">
<tr><th>Id</th><th>Name</th><th>description</th><th></th><th></th><th></th></tr>
<c:forEach items="${projects}" var="project" >
<tr>
    <td>${project.projectId}</td>
    <td class ="project-details">${project.projectName}</td>
    <td class ="project-details">${project.projectDescription}</td>
    <td class ="project-details"><a href="${project.projectLink}" target="_blank">Link</a></td>
    <%-- <security:authorize if=hasAnyRole('ROLE_ADMIN')> --%>
   <%-- <td> --%>
    <%-- <spring:url value="/projects/delete?projectId=${project.projectId}" var="deleteProjectUrl"/>
        <a class="btn btn-danger" href="${deleteProjectUrl}">Delete</a>
    --%>
   <%-- </td>
        <td>--%>
      <%--<spring:url value="/projects/update?projectId=${project.projectId}" var="updateUrl"/>

        <button class="btn btn-default update-project" src="${updateUrl}">Update </button>
        --%>
    <%-- </td>
</tr>

</c:forEach>
</table>--%>


<%--        <spring:url value="/projects/projects" var="addProjectUrl" htmlEscape="true"/>
            <a class="btn btn-default" href="${addProjectUrl}">Add Project <span class="glyphicon glyphicon-plus"></span></a>

<div ng-app="projectApp" ng-controller="projectCtrl">
<!--{{ firstName + " " + lastName }}-->
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

<script type="text/javascript" src="../resources/js/projectApp.js"></script>


--%>