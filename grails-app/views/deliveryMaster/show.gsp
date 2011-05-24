
<%@ page import="com.gydoc.esm.domain.DeliveryMaster" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deliveryMaster.label', default: 'DeliveryMaster')}" />
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
                            <td valign="top" class="name"><g:message code="deliveryMaster.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: deliveryMasterInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="deliveryMaster.customer.label" default="Customer" /></td>
                            
                            <td valign="top" class="value"><g:link controller="customer" action="show" id="${deliveryMasterInstance?.customer?.id}">${deliveryMasterInstance?.customer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="deliveryMaster.salesMan.label" default="Sales Man" /></td>
                            
                            <td valign="top" class="value"><g:link controller="salesMan" action="show" id="${deliveryMasterInstance?.salesMan?.id}">${deliveryMasterInstance?.salesMan?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="deliveryMaster.totalPrice.label" default="Total Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: deliveryMasterInstance, field: "totalPrice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="deliveryMaster.deliveryAddress.label" default="Delivery Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: deliveryMasterInstance, field: "deliveryAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="deliveryMaster.deliveryDate.label" default="Delivery Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${deliveryMasterInstance?.deliveryDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="deliveryMaster.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: deliveryMasterInstance, field: "status")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${deliveryMasterInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
