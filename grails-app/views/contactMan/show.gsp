
<%@ page import="com.gydoc.esm.domain.ContactMan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactMan.label', default: 'ContactMan')}" />
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
                            <td valign="top" class="name"><g:message code="contactMan.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactManInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMan.chineseName.label" default="Chinese Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactManInstance, field: "chineseName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMan.englishName.label" default="English Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactManInstance, field: "englishName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMan.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactManInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMan.telephone.label" default="Telephone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactManInstance, field: "telephone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMan.mobilePhone.label" default="Mobile Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactManInstance, field: "mobilePhone")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${contactManInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
