
<%@ page import="com.gydoc.esm.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'product.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="safeStock" title="${message(code: 'product.safeStock.label', default: 'Safe Stock')}" />
                        
                            <g:sortableColumn property="lastPurchaseDate" title="${message(code: 'product.lastPurchaseDate.label', default: 'Last Purchase Date')}" />
                        
                            <g:sortableColumn property="lastDeliveryDate" title="${message(code: 'product.lastDeliveryDate.label', default: 'Last Delivery Date')}" />
                        
                            <g:sortableColumn property="quantity" title="${message(code: 'product.quantity.label', default: 'Quantity')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productInstanceList}" status="i" var="productInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: productInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "safeStock")}</td>
                        
                            <td><g:formatDate date="${productInstance.lastPurchaseDate}" /></td>
                        
                            <td><g:formatDate date="${productInstance.lastDeliveryDate}" /></td>
                        
                            <td>${fieldValue(bean: productInstance, field: "quantity")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
