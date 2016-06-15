<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../init.jspf" %>



<h2 class="columnHeading">Päivitä käyttäjiä.</h2>

<p>
    Päivitä käyttäjätilin käyttäjänimi.
</p>

<c:forEach items="${users}" var="user" >
<spring:url value="/user/update" var="formAction" htmlEscape="true"/>
<form:form modelAttribute="form" id="personform-${user.id}" methodParam="POST" action="${formAction}" cssClass="userForm">


    <div class="formRowHolder">
        <form:hidden path="userId" value="${user.id}"/><form:errors element="id" />
        <label>Kirjautumistunnus</label><span><form:input path="userName" value="${user.userName}"/><form:errors element="userName" /></span>
    </div>

    <form:button type="submit" id="formSubmit" name="formSubmit" value="save">Tallenna</form:button>
</form:form>
</c:forEach>
