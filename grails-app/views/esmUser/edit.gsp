

<%@ page import="com.gydoc.esm.domain.EsmUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'esmUser.label', default: 'EsmUser')}" />
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
            <g:hasErrors bean="${esmUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${esmUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${esmUserInstance?.id}" />
                <g:hiddenField name="version" value="${esmUserInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="userID"><g:message code="esmUser.userID.label" default="User ID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: esmUserInstance, field: 'userID', 'errors')}">
                                    <g:textField name="userID" value="${esmUserInstance?.userID}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><g:message code="esmUser.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: esmUserInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${esmUserInstance?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="esmUser.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: esmUserInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${esmUserInstance?.lastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="esmUser.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: esmUserInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${esmUserInstance?.password}" />
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
