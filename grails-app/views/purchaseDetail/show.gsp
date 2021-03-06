
<%@ page import="com.gydoc.esm.domain.PurchaseDetail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseDetail.label', default: 'PurchaseDetail')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="purchaseDetail.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: purchaseDetailInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="purchaseDetail.product.label" default="Product" /></td>
                            
                            <td valign="top" class="value"><g:link controller="product" action="show" id="${purchaseDetailInstance?.product?.id}">${purchaseDetailInstance?.product?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="purchaseDetail.quantity.label" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: purchaseDetailInstance, field: "quantity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="purchaseDetail.unitPrice.label" default="Unit Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: purchaseDetailInstance, field: "unitPrice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="purchaseDetail.total.label" default="Total" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: purchaseDetailInstance, field: "total")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="purchaseDetail.purchaseMaster.label" default="Purchase Master" /></td>
                            
                            <td valign="top" class="value"><g:link controller="purchaseMaster" action="show" id="${purchaseDetailInstance?.purchaseMaster?.id}">${purchaseDetailInstance?.purchaseMaster?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${purchaseDetailInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
