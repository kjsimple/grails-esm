

<%@ page import="com.gydoc.esm.domain.Supplier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
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
            <g:hasErrors bean="${supplierInstance}">
            <div class="errors">
                <g:renderErrors bean="${supplierInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${supplierInstance?.id}" />
                <g:hiddenField name="version" value="${supplierInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="simpleName"><g:message code="supplier.simpleName.label" default="Simple Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'simpleName', 'errors')}">
                                    <g:textField name="simpleName" maxlength="20" value="${supplierInstance?.simpleName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fullName"><g:message code="supplier.fullName.label" default="Full Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'fullName', 'errors')}">
                                    <g:textField name="fullName" maxlength="60" value="${supplierInstance?.fullName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="owner"><g:message code="supplier.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'owner', 'errors')}">
                                    <g:textField name="owner" maxlength="30" value="${supplierInstance?.owner}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="supplier.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" maxlength="30" value="${supplierInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telephone"><g:message code="supplier.telephone.label" default="Telephone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'telephone', 'errors')}">
                                    <g:textField name="telephone" maxlength="20" value="${supplierInstance?.telephone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mobilePhone"><g:message code="supplier.mobilePhone.label" default="Mobile Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'mobilePhone', 'errors')}">
                                    <g:textField name="mobilePhone" maxlength="20" value="${supplierInstance?.mobilePhone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fax"><g:message code="supplier.fax.label" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'fax', 'errors')}">
                                    <g:textField name="fax" maxlength="20" value="${supplierInstance?.fax}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="companyAddress"><g:message code="supplier.companyAddress.label" default="Company Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'companyAddress', 'errors')}">
                                    <g:textField name="companyAddress" maxlength="100" value="${supplierInstance?.companyAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="factoryAddress"><g:message code="supplier.factoryAddress.label" default="Factory Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'factoryAddress', 'errors')}">
                                    <g:textField name="factoryAddress" maxlength="100" value="${supplierInstance?.factoryAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastPurchaseDate"><g:message code="supplier.lastPurchaseDate.label" default="Last Purchase Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'lastPurchaseDate', 'errors')}">
                                    <g:datePicker name="lastPurchaseDate" precision="day" value="${supplierInstance?.lastPurchaseDate}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactMan"><g:message code="supplier.contactMan.label" default="Contact Man" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'contactMan', 'errors')}">
                                    <g:select name="contactMan.id" from="${com.gydoc.esm.domain.ContactMan.list()}" optionKey="id" value="${supplierInstance?.contactMan?.id}"  />
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
