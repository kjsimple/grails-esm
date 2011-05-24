

<%@ page import="com.gydoc.esm.domain.DeliveryMaster" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deliveryMaster.label', default: 'DeliveryMaster')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${deliveryMasterInstance}">
            <div class="errors">
                <g:renderErrors bean="${deliveryMasterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="customer"><g:message code="deliveryMaster.customer.label" default="Customer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deliveryMasterInstance, field: 'customer', 'errors')}">
                                    <g:select name="customer.id" from="${com.gydoc.esm.domain.Customer.list()}" optionKey="id" value="${deliveryMasterInstance?.customer?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="salesMan"><g:message code="deliveryMaster.salesMan.label" default="Sales Man" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deliveryMasterInstance, field: 'salesMan', 'errors')}">
                                    <g:select name="salesMan.id" from="${com.gydoc.esm.domain.SalesMan.list()}" optionKey="id" value="${deliveryMasterInstance?.salesMan?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="totalPrice"><g:message code="deliveryMaster.totalPrice.label" default="Total Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deliveryMasterInstance, field: 'totalPrice', 'errors')}">
                                    <g:textField name="totalPrice" value="${fieldValue(bean: deliveryMasterInstance, field: 'totalPrice')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="deliveryAddress"><g:message code="deliveryMaster.deliveryAddress.label" default="Delivery Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deliveryMasterInstance, field: 'deliveryAddress', 'errors')}">
                                    <g:textField name="deliveryAddress" value="${deliveryMasterInstance?.deliveryAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="deliveryDate"><g:message code="deliveryMaster.deliveryDate.label" default="Delivery Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deliveryMasterInstance, field: 'deliveryDate', 'errors')}">
                                    <g:datePicker name="deliveryDate" precision="day" value="${deliveryMasterInstance?.deliveryDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="deliveryMaster.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deliveryMasterInstance, field: 'status', 'errors')}">
                                    <g:textField name="status" value="${fieldValue(bean: deliveryMasterInstance, field: 'status')}" />
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
