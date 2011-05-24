
<%@ page import="com.gydoc.esm.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
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
                            <td valign="top" class="name"><g:message code="product.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.safeStock.label" default="Safe Stock" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "safeStock")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.lastPurchaseDate.label" default="Last Purchase Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${productInstance?.lastPurchaseDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.lastDeliveryDate.label" default="Last Delivery Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${productInstance?.lastDeliveryDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.quantity.label" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "quantity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.suggestBuyPrice.label" default="Suggest Buy Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "suggestBuyPrice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.suggestSalePrice.label" default="Suggest Sale Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "suggestSalePrice")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${productInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
