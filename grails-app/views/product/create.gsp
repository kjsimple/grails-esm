

<%@ page import="com.gydoc.esm.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="product.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="200" value="${productInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="safeStock"><g:message code="product.safeStock.label" default="Safe Stock" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'safeStock', 'errors')}">
                                    <g:textField name="safeStock" value="${fieldValue(bean: productInstance, field: 'safeStock')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastPurchaseDate"><g:message code="product.lastPurchaseDate.label" default="Last Purchase Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'lastPurchaseDate', 'errors')}">
                                    <g:datePicker name="lastPurchaseDate" precision="day" value="${productInstance?.lastPurchaseDate}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastDeliveryDate"><g:message code="product.lastDeliveryDate.label" default="Last Delivery Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'lastDeliveryDate', 'errors')}">
                                    <g:datePicker name="lastDeliveryDate" precision="day" value="${productInstance?.lastDeliveryDate}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantity"><g:message code="product.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${fieldValue(bean: productInstance, field: 'quantity')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="suggestBuyPrice"><g:message code="product.suggestBuyPrice.label" default="Suggest Buy Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'suggestBuyPrice', 'errors')}">
                                    <g:textField name="suggestBuyPrice" value="${fieldValue(bean: productInstance, field: 'suggestBuyPrice')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="suggestSalePrice"><g:message code="product.suggestSalePrice.label" default="Suggest Sale Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'suggestSalePrice', 'errors')}">
                                    <g:textField name="suggestSalePrice" value="${fieldValue(bean: productInstance, field: 'suggestSalePrice')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
