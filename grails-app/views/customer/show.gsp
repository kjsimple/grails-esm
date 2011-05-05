
<%@ page import="com.gydoc.esm.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                            <td valign="top" class="name"><g:message code="customer.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.simpleName.label" default="Simple Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "simpleName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fullName.label" default="Full Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fullName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.owner.label" default="Owner" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "owner")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.telephone.label" default="Telephone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "telephone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.mobilePhone.label" default="Mobile Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "mobilePhone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fax.label" default="Fax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fax")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.customerAddress.label" default="Customer Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "customerAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.deliveryAddress.label" default="Delivery Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "deliveryAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.invoiceAddress.label" default="Invoice Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "invoiceAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.deliveryDate.label" default="Delivery Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${customerInstance?.deliveryDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.contactMan.label" default="Contact Man" /></td>
                            
                            <td valign="top" class="value"><g:link controller="contactMan" action="show" id="${customerInstance?.contactMan?.id}">${customerInstance?.contactMan?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.salesMan.label" default="Sales Man" /></td>
                            
                            <td valign="top" class="value"><g:link controller="salesMan" action="show" id="${customerInstance?.salesMan?.id}">${customerInstance?.salesMan?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${customerInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
