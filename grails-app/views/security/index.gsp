<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title><g:message code="login.dialog.title" default="Login" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/themes/start/jquery-ui.css" type="text/css" media="all" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(function() {
          $(':submit').button();
          $('form').bind('submit', function(evt) {
              $('#errors').empty().removeClass('errors');
              evt.preventDefault();
              $.ajax({ type: 'POST', url: $('form').attr('action'), data: $('form').serialize(), dataType: 'json',
                       success: function(data) {
                                            if (data.res == 0) {
                                                $('#errors').append('<ul><li></li></ul>').find('li').text(data.msg).end().addClass('errors');
                                            } else {
                                                $('#dialog').dialog('close');
                                                var url = window.location.href;
                                                window.location.replace(url.substring(0, url.lastIndexOf('/')))
                                            }
                       }
              });
          });
          $('#dialog').dialog({width: 300, height: 200, closeOnEscape: false, resizable: false, hide: 'explode',
                               show: {duration: 1500, effect: 'clip', complete: function() {$('#userid').focus();} },
                               open: function() { $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();}
                       });
      });
    </script>
  </head>

<body>
<div id="dialog" title="<g:message code="login.dialog.title" default="Login" />">
  <g:form action="login" method="POST">
    <table class="normal">
      <tr>
        <td><label for="userid"><g:message code="login.dialog.userid" default="User ID:" /></label></td>
        <td><input type="text" name="userid" value="" id="userid" /></td>
      </tr>
      <tr>
        <td><label for="pass"><g:message code="login.dialog.password" default="Password:" /></label></td>
        <td><input type="password" id="pass" name="password" value="" /></td>
      </tr>
      <tr>
        <td colspan="2" class="formButtons"><input id="loginBtn" type="submit" value="<g:message code="login.dialog.loginBtn" default="Login" />" /></td>
      </tr>
    </table>
    <div id="errors"></div>
  </g:form>

</div>
</body>
</html>
