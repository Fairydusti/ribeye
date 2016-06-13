<%@ include file="../init.jspf" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<h1>Account [${username}]</h1>

<spring:url value="/account/update" var="changeAccount" htmlEscape="true"/>
<a href="${changeAccount}">Change your account</a>
