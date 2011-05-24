
<%@ page import="com.gydoc.esm.domain.ExpenseReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'expenseReport.label', default: 'ExpenseReport')}" />
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
                            <td valign="top" class="name"><g:message code="expenseReport.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: expenseReportInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="expenseReport.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: expenseReportInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="expenseReport.total.label" default="Total" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: expenseReportInstance, field: "total")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="expenseReport.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: expenseReportInstance, field: "status")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="expenseReport.purpose.label" default="Purpose" /></td>
                            
                            <td valign="top" class="value"><g:link controller="purpose" action="show" id="${expenseReportInstance?.purpose?.id}">${expenseReportInstance?.purpose?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="expenseReport.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${expenseReportInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="expenseReport.dateUpdate.label" default="Date Update" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${expenseReportInstance?.dateUpdate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="expenseReport.owner.label" default="Owner" /></td>
                            
                            <td valign="top" class="value"><g:link controller="esmUser" action="show" id="${expenseReportInstance?.owner?.id}">${expenseReportInstance?.owner?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${expenseReportInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
