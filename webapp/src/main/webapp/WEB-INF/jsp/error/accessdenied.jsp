<%@ include file="../../init.jspf" %>


<div class ="col-md-8 col-md-offset-4">
<div class ="panel panel-danger">
    <h2> <spring:message code="message.access.denied" text="Access denied" /></h2>
</div>
<spring:url value="/home" var="homeUrl" htmlEscape="true"/>
<a href="${homeUrl}"><spring:message code="header.menu.home" text="Home" /></a>
</div>