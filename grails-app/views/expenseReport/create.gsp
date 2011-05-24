

<%@ page import="com.gydoc.esm.domain.ExpenseReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'expenseReport.label', default: 'ExpenseReport')}" />
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
            <g:hasErrors bean="${expenseReportInstance}">
            <div class="errors">
                <g:renderErrors bean="${expenseReportInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="expenseReport.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: expenseReportInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${expenseReportInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="total"><g:message code="expenseReport.total.label" default="Total" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: expenseReportInstance, field: 'total', 'errors')}">
                                    <g:textField name="total" value="${fieldValue(bean: expenseReportInstance, field: 'total')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="expenseReport.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: expenseReportInstance, field: 'status', 'errors')}">
                                    <g:textField name="status" value="${fieldValue(bean: expenseReportInstance, field: 'status')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="purpose"><g:message code="expenseReport.purpose.label" default="Purpose" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: expenseReportInstance, field: 'purpose', 'errors')}">
                                    <g:select name="purpose.id" from="${com.gydoc.esm.domain.Purpose.list()}" optionKey="id" value="${expenseReportInstance?.purpose?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateUpdate"><g:message code="expenseReport.dateUpdate.label" default="Date Update" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: expenseReportInstance, field: 'dateUpdate', 'errors')}">
                                    <g:datePicker name="dateUpdate" precision="day" value="${expenseReportInstance?.dateUpdate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="owner"><g:message code="expenseReport.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: expenseReportInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${com.gydoc.esm.domain.EsmUser.list()}" optionKey="id" value="${expenseReportInstance?.owner?.id}"  />
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
