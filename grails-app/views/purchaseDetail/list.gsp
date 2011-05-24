
<%@ page import="com.gydoc.esm.domain.PurchaseDetail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseDetail.label', default: 'PurchaseDetail')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'purchaseDetail.id.label', default: 'Id')}" />
                        
                            <th><g:message code="purchaseDetail.product.label" default="Product" /></th>
                        
                            <g:sortableColumn property="quantity" title="${message(code: 'purchaseDetail.quantity.label', default: 'Quantity')}" />
                        
                            <g:sortableColumn property="unitPrice" title="${message(code: 'purchaseDetail.unitPrice.label', default: 'Unit Price')}" />
                        
                            <g:sortableColumn property="total" title="${message(code: 'purchaseDetail.total.label', default: 'Total')}" />
                        
                            <th><g:message code="purchaseDetail.purchaseMaster.label" default="Purchase Master" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${purchaseDetailInstanceList}" status="i" var="purchaseDetailInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${purchaseDetailInstance.id}">${fieldValue(bean: purchaseDetailInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: purchaseDetailInstance, field: "product")}</td>
                        
                            <td>${fieldValue(bean: purchaseDetailInstance, field: "quantity")}</td>
                        
                            <td>${fieldValue(bean: purchaseDetailInstance, field: "unitPrice")}</td>
                        
                            <td>${fieldValue(bean: purchaseDetailInstance, field: "total")}</td>
                        
                            <td>${fieldValue(bean: purchaseDetailInstance, field: "purchaseMaster")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${purchaseDetailInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
