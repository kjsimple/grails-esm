
<%@ page import="com.gydoc.esm.domain.EsmUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'esmUser.label', default: 'EsmUser')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'esmUser.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="userID" title="${message(code: 'esmUser.userID.label', default: 'User ID')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'esmUser.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'esmUser.lastName.label', default: 'Last Name')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${esmUserInstanceList}" status="i" var="esmUserInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${esmUserInstance.id}">${fieldValue(bean: esmUserInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: esmUserInstance, field: "userID")}</td>
                        
                            <td>${fieldValue(bean: esmUserInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: esmUserInstance, field: "lastName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${esmUserInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
