<!DOCTYPE html>
<html>
<head>
  <title><g:layoutTitle default="ESM" /></title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="application" />
</head>
<body>
  <div id="spinner" class="spinner" style="display:none;">
      <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
  </div>
  <table class="normal" width="100%" border="0" cellspacing="0" cellpadding="0" id="appShell">
    <tr>
      <td id="appHead" width="100%">
        <div class="actions">
          <a class="appName" href="${application.contextPath}">ESM</a>
          <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <g:link controller="${c.logicalPropertyName}">${c.name}</g:link>
          </g:each>
        </div>
      </td>
    </tr>
    <tr>
      <td width="100%" height="100%">
        <g:layoutBody />
      </td>
    </tr>
  </table>
</body>
</html>