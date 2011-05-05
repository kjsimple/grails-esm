

<%@ page import="com.gydoc.esm.domain.PurchaseDetail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseDetail.label', default: 'PurchaseDetail')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${purchaseDetailInstance}">
            <div class="errors">
                <g:renderErrors bean="${purchaseDetailInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${purchaseDetailInstance?.id}" />
                <g:hiddenField name="version" value="${purchaseDetailInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="product"><g:message code="purchaseDetail.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseDetailInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" from="${com.gydoc.esm.domain.Product.list()}" optionKey="id" value="${purchaseDetailInstance?.product?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantity"><g:message code="purchaseDetail.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseDetailInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${fieldValue(bean: purchaseDetailInstance, field: 'quantity')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="unitPrice"><g:message code="purchaseDetail.unitPrice.label" default="Unit Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseDetailInstance, field: 'unitPrice', 'errors')}">
                                    <g:textField name="unitPrice" value="${fieldValue(bean: purchaseDetailInstance, field: 'unitPrice')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="total"><g:message code="purchaseDetail.total.label" default="Total" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseDetailInstance, field: 'total', 'errors')}">
                                    <g:textField name="total" value="${fieldValue(bean: purchaseDetailInstance, field: 'total')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="purchaseMaster"><g:message code="purchaseDetail.purchaseMaster.label" default="Purchase Master" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseDetailInstance, field: 'purchaseMaster', 'errors')}">
                                    <g:select name="purchaseMaster.id" from="${com.gydoc.esm.domain.PurchaseMaster.list()}" optionKey="id" value="${purchaseDetailInstance?.purchaseMaster?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
