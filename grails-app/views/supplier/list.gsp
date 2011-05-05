
<%@ page import="com.gydoc.esm.domain.Supplier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'supplier.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="simpleName" title="${message(code: 'supplier.simpleName.label', default: 'Simple Name')}" />
                        
                            <g:sortableColumn property="fullName" title="${message(code: 'supplier.fullName.label', default: 'Full Name')}" />
                        
                            <g:sortableColumn property="owner" title="${message(code: 'supplier.owner.label', default: 'Owner')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'supplier.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="telephone" title="${message(code: 'supplier.telephone.label', default: 'Telephone')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${supplierInstanceList}" status="i" var="supplierInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${supplierInstance.id}">${fieldValue(bean: supplierInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "simpleName")}</td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "fullName")}</td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "owner")}</td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "telephone")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${supplierInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
