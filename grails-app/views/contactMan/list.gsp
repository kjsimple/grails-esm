
<%@ page import="com.gydoc.esm.domain.ContactMan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactMan.label', default: 'ContactMan')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'contactMan.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="chineseName" title="${message(code: 'contactMan.chineseName.label', default: 'Chinese Name')}" />
                        
                            <g:sortableColumn property="englishName" title="${message(code: 'contactMan.englishName.label', default: 'English Name')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'contactMan.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="telephone" title="${message(code: 'contactMan.telephone.label', default: 'Telephone')}" />
                        
                            <g:sortableColumn property="mobilePhone" title="${message(code: 'contactMan.mobilePhone.label', default: 'Mobile Phone')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contactManInstanceList}" status="i" var="contactManInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${contactManInstance.id}">${fieldValue(bean: contactManInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: contactManInstance, field: "chineseName")}</td>
                        
                            <td>${fieldValue(bean: contactManInstance, field: "englishName")}</td>
                        
                            <td>${fieldValue(bean: contactManInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: contactManInstance, field: "telephone")}</td>
                        
                            <td>${fieldValue(bean: contactManInstance, field: "mobilePhone")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${contactManInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
