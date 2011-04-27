
<%@ page import="com.gydoc.esm.domain.Purpose" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purpose.label', default: 'Purpose')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'purpose.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'purpose.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'purpose.description.label', default: 'Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${purposeInstanceList}" status="i" var="purposeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${purposeInstance.id}">${fieldValue(bean: purposeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: purposeInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: purposeInstance, field: "description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${purposeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
