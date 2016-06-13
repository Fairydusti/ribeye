<%@ include file="../../init.jspf" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<nav class="navbar navbar-inverse">

    <div class="menu container-fluid">
        <ul class ="nav navbar-nav">
            <li>
                <spring:url value="/home" var="homeUrl" htmlEscape="true"/>
                <a href="${homeUrl}"><spring:message code="header.menu.home" text="Home" /></a>
            </li>
            <li>
                <spring:url value="/about" var="aboutUrl" htmlEscape="true"/>
                <a href="${aboutUrl}"><spring:message code="header.menu.about" text="About" /></a>
            </li>
            <li>
                <spring:url value="/account" var="accountUrl" htmlEscape="true"/>
                <a href="${accountUrl}"><spring:message code="header.menu.account" text="Account" /></a>
            </li>
            <li>
            <%--Changed  value j_spring_security_logout -> /logout --%>

             <spring:url value="/logout" var="logoutUrl" htmlEscape="true"/>
              <a href="${logoutUrl}"><spring:message code="header.menu.logout" text="Logout" /></a>
            </li>
            <li>
                <spring:url value="/login" var="loginUrl" htmlEscape="true"/>
                <a href="${loginUrl}"><spring:message code="header.menu.login" text="Login" /></a>
            </li>
<%--
            <li>
                        <spring:url value="/formexample" var="feUrl" htmlEscape="true"/>
                        <a href="${feUrl}">Form Example</a>
                    </li>

            <li>
                <spring:url value="/numberlist/start" var="nlUrl" htmlEscape="true"/>
                <a href="${nlUrl}">Numberlist</a>
            </li>
--%>
            <li>
                <spring:url value="/quiz" var="quizUrl" htmlEscape="true"/>
                <a href="${quizUrl}"><spring:message code="header.menu.quiz" text="Quiz" /></a>
             </li>

             <li>
                 <spring:url value="/user/create" var="userUrl" htmlEscape="true"/>
                 <a href="${userUrl}"><spring:message code="header.menu.addUser" text="Create User" /></a>
             </li>
             <li>
                  <spring:url value="/account/list" var="accListUrl" htmlEscape="true"/>
              <a href="${accListUrl}"><spring:message code="header.menu.accounts" text="Accounts" /></a>
            </li>


            <li>
                           <spring:url value="/deck" var="deckUrl" htmlEscape="true"/>
                           <a href="${deckUrl}">Deck</a>
                       </li>

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <spring:message code="header.menu.projects" text="Projects" />
                <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li>
                        <spring:url value="/projects/projects" var="projectUrl" htmlEscape="true"/>
                        <a href="${projectUrl}">Add Project</a>
                    </li>
                    <li>
                        <spring:url value="/projects/list" var="projectsListUrl" htmlEscape="true"/>
                        <a href="${projectsListUrl}">List Projects</a>
                    </li>
                </ul>
            </li>
            <li class ="dropdown">
                <a href="#" class ="dropdown-toggle pull-right" data-toggle="dropdown">
                     <span class="caret"></span>
                    <span style="color:#40E0D0;" class="glyphicon glyphicon-user"></span>
                </a>
                <ul class="dropdown-menu" id ="menu-login">
                    <h4><spring:message code="header.menu.login" text="Login" /></h4>
                    <%--Login form--%>
                    <c:if test="${not empty param.direct}" >
                        <c:remove scope="session" var="SPRING_SECURITY_REQUEST_KEY"/>
                    </c:if>
                    <c:if test="${not empty param.error}">
                        <div class="error-message">
                            ${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
                        </div>
                    </c:if>
                    <form method="post" action="${pageContext.request.contextPath}/j_spring_security_check" id="loginForm">
                    <div id="passwordLoginOption" class="form col-md-12">
                        <div class="row form-group">
                            <div class="label">
                                <label for="username">Tunnus:</label>
                            </div>
                            <div class="input">
                                <div class="textWrapper">
                                    <input type="text" id="username" name="username" class="form-control"/>
                                </div>
                            </div>
                            <div class="cl"></div>
                        </div>
                        <div class="row form-group">
                            <div class="label">
                                <label for="password">Salasana:</label>
                            </div>
                            <div class="input">
                                <div class="textWrapper">
                                    <input type="password" id="password" name="password" class="form-control"/>
                                </div>
                            </div>
                            <div class="cl"></div>
                        </div>
                        <div class="row">
                            <div class="check">
                                <label hidden style="display:none" class="forCheckbox" for='_spring_security_remember_me'>
                                    Remember me:
                                    <input hidden style="display:none" type='checkbox' id="_spring_security_remember_me" name='_spring_security_remember_me'/>
                                </label>
                            </div>
                            <div class="cl"></div>
                        </div>
                        <div >
                            <input type="submit" value="Kirjaudu" id="loginFormSubmit" class="btn btn-sm btn-primary"/>
                        </div>
                    </div>
                    </form>
                </ul>
            </li>
        </ul>
    </div>
</nav>