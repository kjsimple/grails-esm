

<%@ page import="com.gydoc.esm.domain.SalesMan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'salesMan.label', default: 'SalesMan')}" />
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
            <g:hasErrors bean="${salesManInstance}">
            <div class="errors">
                <g:renderErrors bean="${salesManInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="salesMan.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salesManInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="10" value="${salesManInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contactAddress"><g:message code="salesMan.contactAddress.label" default="Contact Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salesManInstance, field: 'contactAddress', 'errors')}">
                                    <g:textField name="contactAddress" maxlength="200" value="${salesManInstance?.contactAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="salesMan.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salesManInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" maxlength="100" value="${salesManInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telephone"><g:message code="salesMan.telephone.label" default="Telephone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salesManInstance, field: 'telephone', 'errors')}">
                                    <g:textField name="telephone" maxlength="20" value="${salesManInstance?.telephone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mobilePhone"><g:message code="salesMan.mobilePhone.label" default="Mobile Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salesManInstance, field: 'mobilePhone', 'errors')}">
                                    <g:textField name="mobilePhone" maxlength="20" value="${salesManInstance?.mobilePhone}" />
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
