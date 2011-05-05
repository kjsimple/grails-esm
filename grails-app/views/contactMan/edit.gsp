

<%@ page import="com.gydoc.esm.domain.ContactMan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactMan.label', default: 'ContactMan')}" />
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
            <g:hasErrors bean="${contactManInstance}">
            <div class="errors">
                <g:renderErrors bean="${contactManInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${contactManInstance?.id}" />
                <g:hiddenField name="version" value="${contactManInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="chineseName"><g:message code="contactMan.chineseName.label" default="Chinese Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactManInstance, field: 'chineseName', 'errors')}">
                                    <g:textField name="chineseName" maxlength="10" value="${contactManInstance?.chineseName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="englishName"><g:message code="contactMan.englishName.label" default="English Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactManInstance, field: 'englishName', 'errors')}">
                                    <g:textField name="englishName" maxlength="60" value="${contactManInstance?.englishName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="contactMan.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactManInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" maxlength="20" value="${contactManInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telephone"><g:message code="contactMan.telephone.label" default="Telephone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactManInstance, field: 'telephone', 'errors')}">
                                    <g:textField name="telephone" maxlength="20" value="${contactManInstance?.telephone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mobilePhone"><g:message code="contactMan.mobilePhone.label" default="Mobile Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactManInstance, field: 'mobilePhone', 'errors')}">
                                    <g:textField name="mobilePhone" maxlength="20" value="${contactManInstance?.mobilePhone}" />
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
