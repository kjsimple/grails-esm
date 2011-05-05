

<%@ page import="com.gydoc.esm.domain.DeliveryDetail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deliveryDetail.label', default: 'DeliveryDetail')}" />
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
            <g:hasErrors bean="${deliveryDetailInstance}">
            <div class="errors">
                <g:renderErrors bean="${deliveryDetailInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="product"><g:message code="deliveryDetail.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deliveryDetailInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" from="${com.gydoc.esm.domain.Product.list()}" optionKey="id" value="${deliveryDetailInstance?.product?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantity"><g:message code="deliveryDetail.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deliveryDetailInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${fieldValue(bean: deliveryDetailInstance, field: 'quantity')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unitPrice"><g:message code="deliveryDetail.unitPrice.label" default="Unit Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deliveryDetailInstance, field: 'unitPrice', 'errors')}">
                                    <g:textField name="unitPrice" value="${fieldValue(bean: deliveryDetailInstance, field: 'unitPrice')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="total"><g:message code="deliveryDetail.total.label" default="Total" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deliveryDetailInstance, field: 'total', 'errors')}">
                                    <g:textField name="total" value="${fieldValue(bean: deliveryDetailInstance, field: 'total')}" />
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
