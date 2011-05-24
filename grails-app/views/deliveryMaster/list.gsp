
<%@ page import="com.gydoc.esm.domain.DeliveryMaster" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deliveryMaster.label', default: 'DeliveryMaster')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'deliveryMaster.id.label', default: 'Id')}" />
                        
                            <th><g:message code="deliveryMaster.customer.label" default="Customer" /></th>
                        
                            <th><g:message code="deliveryMaster.salesMan.label" default="Sales Man" /></th>
                        
                            <g:sortableColumn property="totalPrice" title="${message(code: 'deliveryMaster.totalPrice.label', default: 'Total Price')}" />
                        
                            <g:sortableColumn property="deliveryAddress" title="${message(code: 'deliveryMaster.deliveryAddress.label', default: 'Delivery Address')}" />
                        
                            <g:sortableColumn property="deliveryDate" title="${message(code: 'deliveryMaster.deliveryDate.label', default: 'Delivery Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${deliveryMasterInstanceList}" status="i" var="deliveryMasterInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${deliveryMasterInstance.id}">${fieldValue(bean: deliveryMasterInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: deliveryMasterInstance, field: "customer")}</td>
                        
                            <td>${fieldValue(bean: deliveryMasterInstance, field: "salesMan")}</td>
                        
                            <td>${fieldValue(bean: deliveryMasterInstance, field: "totalPrice")}</td>
                        
                            <td>${fieldValue(bean: deliveryMasterInstance, field: "deliveryAddress")}</td>
                        
                            <td><g:formatDate date="${deliveryMasterInstance.deliveryDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${deliveryMasterInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
