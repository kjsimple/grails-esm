
<%@ page import="com.gydoc.esm.domain.SalesMan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'salesMan.label', default: 'SalesMan')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'salesMan.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'salesMan.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="contactAddress" title="${message(code: 'salesMan.contactAddress.label', default: 'Contact Address')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'salesMan.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="telephone" title="${message(code: 'salesMan.telephone.label', default: 'Telephone')}" />
                        
                            <g:sortableColumn property="mobilePhone" title="${message(code: 'salesMan.mobilePhone.label', default: 'Mobile Phone')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${salesManInstanceList}" status="i" var="salesManInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${salesManInstance.id}">${fieldValue(bean: salesManInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: salesManInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: salesManInstance, field: "contactAddress")}</td>
                        
                            <td>${fieldValue(bean: salesManInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: salesManInstance, field: "telephone")}</td>
                        
                            <td>${fieldValue(bean: salesManInstance, field: "mobilePhone")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${salesManInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
