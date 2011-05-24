

<%@ page import="com.gydoc.esm.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="simpleName"><g:message code="customer.simpleName.label" default="Simple Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'simpleName', 'errors')}">
                                    <g:textField name="simpleName" maxlength="20" value="${customerInstance?.simpleName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fullName"><g:message code="customer.fullName.label" default="Full Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fullName', 'errors')}">
                                    <g:textField name="fullName" maxlength="60" value="${customerInstance?.fullName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="owner"><g:message code="customer.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'owner', 'errors')}">
                                    <g:textField name="owner" maxlength="30" value="${customerInstance?.owner}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="customer.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" maxlength="30" value="${customerInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telephone"><g:message code="customer.telephone.label" default="Telephone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'telephone', 'errors')}">
                                    <g:textField name="telephone" maxlength="20" value="${customerInstance?.telephone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mobilePhone"><g:message code="customer.mobilePhone.label" default="Mobile Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'mobilePhone', 'errors')}">
                                    <g:textField name="mobilePhone" maxlength="20" value="${customerInstance?.mobilePhone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fax"><g:message code="customer.fax.label" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
                                    <g:textField name="fax" maxlength="20" value="${customerInstance?.fax}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="customerAddress"><g:message code="customer.customerAddress.label" default="Customer Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'customerAddress', 'errors')}">
                                    <g:textField name="customerAddress" maxlength="100" value="${customerInstance?.customerAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="deliveryAddress"><g:message code="customer.deliveryAddress.label" default="Delivery Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'deliveryAddress', 'errors')}">
                                    <g:textField name="deliveryAddress" maxlength="100" value="${customerInstance?.deliveryAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="invoiceAddress"><g:message code="customer.invoiceAddress.label" default="Invoice Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'invoiceAddress', 'errors')}">
                                    <g:textField name="invoiceAddress" maxlength="100" value="${customerInstance?.invoiceAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="deliveryDate"><g:message code="customer.deliveryDate.label" default="Delivery Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'deliveryDate', 'errors')}">
                                    <g:datePicker name="deliveryDate" precision="day" value="${customerInstance?.deliveryDate}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactMan"><g:message code="customer.contactMan.label" default="Contact Man" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'contactMan', 'errors')}">
                                    <g:select name="contactMan.id" from="${com.gydoc.esm.domain.ContactMan.list()}" optionKey="id" value="${customerInstance?.contactMan?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="salesMan"><g:message code="customer.salesMan.label" default="Sales Man" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'salesMan', 'errors')}">
                                    <g:select name="salesMan.id" from="${com.gydoc.esm.domain.SalesMan.list()}" optionKey="id" value="${customerInstance?.salesMan?.id}"  />
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
