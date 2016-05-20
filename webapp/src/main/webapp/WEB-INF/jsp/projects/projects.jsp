<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../init.jspf" %>



<h2 class="columnHeading">Projekti.</h2>

<p>
    Uusi Projekti
</p>

<spring:url value="/projects/projects" var="formAction" htmlEscape="true"/>


<form:form modelAttribute="form" id="projectForm" methodParam="POST" action="${formAction}" cssClass="userForm">

    <div class="formRowHolder form-group">
        <label><spring:message code="projects.form.name" text="Name"/></label><span><form:input class ="form-control" path="projectName" /><form:errors element="projectName" /></span>
    </div>
    <div class="formRowHolder form-group">
        <label><spring:message code="projects.form.description" text="Description"/>:</label><span><form:input class ="form-control" path="projectDescription" /><form:errors element="projectDescription" /></span>
    </div>
    <div class="formRowHolder form-group">
            <label><spring:message code="projects.form.link" text="Link"/></label><span><form:input class ="form-control" path="projectLink"/><form:errors element="projectId" /></span>
    </div>
    <form:button type="submit" id="formSubmit" class="btn btn-primary" name="formSubmit" value="save"><spring:message code="projects.form.save" text="Save"/></form:button>
</form:form>
