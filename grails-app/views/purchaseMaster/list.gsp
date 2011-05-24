
<%@ page import="com.gydoc.esm.domain.PurchaseMaster" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseMaster.label', default: 'PurchaseMaster')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'purchaseMaster.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="status" title="${message(code: 'purchaseMaster.status.label', default: 'Status')}" />
                        
                            <g:sortableColumn property="total" title="${message(code: 'purchaseMaster.total.label', default: 'Total')}" />
                        
                            <g:sortableColumn property="purchaseDate" title="${message(code: 'purchaseMaster.purchaseDate.label', default: 'Purchase Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${purchaseMasterInstanceList}" status="i" var="purchaseMasterInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${purchaseMasterInstance.id}">${fieldValue(bean: purchaseMasterInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: purchaseMasterInstance, field: "status")}</td>
                        
                            <td>${fieldValue(bean: purchaseMasterInstance, field: "total")}</td>
                        
                            <td><g:formatDate date="${purchaseMasterInstance.purchaseDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${purchaseMasterInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
