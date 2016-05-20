<%@ include file="../../init.jspf" %>

<h1>List of oll database users</h1>

<table class="table table-responsive table-striped">
<tr><th>Id</th><th>username</th><th>role</th><th>New role</th></tr>
<c:forEach items="${users}" var="user" >

<tr><td>${user.id}</td><td>${user.userName}</td><td>${user.securityRoles}</td><td>
<a class="btn btn-default" style="margin:3px;" href='<spring:url value="/account/assignrole" htmlEscape="true"/>/${user.id}/ROLE_SUPERUSER'>ROLE_SUPERUSER</a><br />
<a class="btn btn-default" style="margin:3px;" href='<spring:url value="/account/assignrole" htmlEscape="true"/>/${user.id}/ROLE_MODERATOR'>ROLE_MODERATOR</a><br />
<a class="btn btn-default" style="margin:3px;" href='<spring:url value="/account/assignrole" htmlEscape="true"/>/${user.id}/ROLE_USER'>ROLE_USER</a><br />
</td></tr>


</c:forEach>
</table>