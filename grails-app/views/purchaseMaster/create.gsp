

<%@ page import="com.gydoc.esm.domain.PurchaseMaster" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseMaster.label', default: 'PurchaseMaster')}" />
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
            <g:hasErrors bean="${purchaseMasterInstance}">
            <div class="errors">
                <g:renderErrors bean="${purchaseMasterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="purchaseMaster.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseMasterInstance, field: 'status', 'errors')}">
                                    <g:textField name="status" value="${fieldValue(bean: purchaseMasterInstance, field: 'status')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="total"><g:message code="purchaseMaster.total.label" default="Total" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseMasterInstance, field: 'total', 'errors')}">
                                    <g:textField name="total" value="${fieldValue(bean: purchaseMasterInstance, field: 'total')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="purchaseDate"><g:message code="purchaseMaster.purchaseDate.label" default="Purchase Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseMasterInstance, field: 'purchaseDate', 'errors')}">
                                    <g:datePicker name="purchaseDate" precision="day" value="${purchaseMasterInstance?.purchaseDate}"  />
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
