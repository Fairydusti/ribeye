<%@ include file="../../init.jspf" %>
<c:if test="${not empty param.direct}" >
<c:remove scope="session" var="SPRING_SECURITY_REQUEST_KEY"/>
</c:if>

<c:if test="${not empty param.error}">
<div class="error-message">
${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
</div>
</c:if>


<h1>Kirjaudu</h1>

<!-- pelkkä  ? j_spring_security_check -->
<form method="post" action="${pageContext.request.contextPath}/j_spring_security_check" id="loginForm">
    <div id="passwordLoginOption" class="form col-md-8 col-md-offset-4">
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
            <input type="submit" value="Kirjaudu" id="loginFormSubmit" class="btn btn-primary"/>
        </div>
    </div>
</form>