
<%@ page import="com.gydoc.esm.domain.DeliveryDetail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deliveryDetail.label', default: 'DeliveryDetail')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'deliveryDetail.id.label', default: 'Id')}" />
                        
                            <th><g:message code="deliveryDetail.product.label" default="Product" /></th>
                        
                            <g:sortableColumn property="quantity" title="${message(code: 'deliveryDetail.quantity.label', default: 'Quantity')}" />
                        
                            <g:sortableColumn property="unitPrice" title="${message(code: 'deliveryDetail.unitPrice.label', default: 'Unit Price')}" />
                        
                            <g:sortableColumn property="total" title="${message(code: 'deliveryDetail.total.label', default: 'Total')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${deliveryDetailInstanceList}" status="i" var="deliveryDetailInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${deliveryDetailInstance.id}">${fieldValue(bean: deliveryDetailInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: deliveryDetailInstance, field: "product")}</td>
                        
                            <td>${fieldValue(bean: deliveryDetailInstance, field: "quantity")}</td>
                        
                            <td>${fieldValue(bean: deliveryDetailInstance, field: "unitPrice")}</td>
                        
                            <td>${fieldValue(bean: deliveryDetailInstance, field: "total")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${deliveryDetailInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
