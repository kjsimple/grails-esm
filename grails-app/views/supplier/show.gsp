
<%@ page import="com.gydoc.esm.domain.Supplier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
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
                            <td valign="top" class="name"><g:message code="supplier.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.simpleName.label" default="Simple Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "simpleName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.fullName.label" default="Full Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "fullName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.owner.label" default="Owner" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "owner")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.telephone.label" default="Telephone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "telephone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.mobilePhone.label" default="Mobile Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "mobilePhone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.fax.label" default="Fax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "fax")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.companyAddress.label" default="Company Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "companyAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.factoryAddress.label" default="Factory Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "factoryAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.lastPurchaseDate.label" default="Last Purchase Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${supplierInstance?.lastPurchaseDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="supplier.contactMan.label" default="Contact Man" /></td>
                            
                            <td valign="top" class="value"><g:link controller="contactMan" action="show" id="${supplierInstance?.contactMan?.id}">${supplierInstance?.contactMan?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${supplierInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
