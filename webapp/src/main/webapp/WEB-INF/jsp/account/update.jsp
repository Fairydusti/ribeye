<%@ include file="../../init.jspf" %>

<h1>Update your username</h1>

<form:form modelAttribute="form" id="changeAccount" methodParam="POST" action="${changeAccount}" cssClass="userForm">
    <form:hidden path="userId" value="${user.id}"/><form:errors element="userId"/>

<div class="formRowHolder">
    <label>Kirjautumistunnus</label><span>
    <form:input path="userName" /><form:errors element="userName" /></span>
</div>
<form:button type="submit" id="formSubmit" name="formSubmit" value="save">Tallenna</form:button>
</form:form>