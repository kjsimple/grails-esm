
<%@ page import="com.gydoc.esm.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'customer.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="simpleName" title="${message(code: 'customer.simpleName.label', default: 'Simple Name')}" />
                        
                            <g:sortableColumn property="fullName" title="${message(code: 'customer.fullName.label', default: 'Full Name')}" />
                        
                            <g:sortableColumn property="owner" title="${message(code: 'customer.owner.label', default: 'Owner')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'customer.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="telephone" title="${message(code: 'customer.telephone.label', default: 'Telephone')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "simpleName")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "fullName")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "owner")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "telephone")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${customerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
