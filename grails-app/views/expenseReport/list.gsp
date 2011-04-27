
<%@ page import="com.gydoc.esm.domain.ExpenseReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'expenseReport.label', default: 'ExpenseReport')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'expenseReport.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'expenseReport.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="total" title="${message(code: 'expenseReport.total.label', default: 'Total')}" />
                        
                            <g:sortableColumn property="status" title="${message(code: 'expenseReport.status.label', default: 'Status')}" />
                        
                            <th><g:message code="expenseReport.purpose.label" default="Purpose" /></th>
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'expenseReport.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${expenseReportInstanceList}" status="i" var="expenseReportInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${expenseReportInstance.id}">${fieldValue(bean: expenseReportInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: expenseReportInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: expenseReportInstance, field: "total")}</td>
                        
                            <td>${fieldValue(bean: expenseReportInstance, field: "status")}</td>
                        
                            <td>${fieldValue(bean: expenseReportInstance, field: "purpose")}</td>
                        
                            <td><g:formatDate date="${expenseReportInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${expenseReportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
