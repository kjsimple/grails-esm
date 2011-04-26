<html>
  <head>
    <title>Login</title>
    <script src="http://ajax.googleapis.com/ajax/libs/dojo/1.6/dojo/dojo.xd.js"></script>
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/dojo/1.6/dijit/themes/tundra/tundra.css" />
  </head>

<body class="tundra">
<script type="text/javascript">
  dojo.require('dijit.Dialog')

  dojo.addOnLoad(function() {
      loginDialog = new dijit.Dialog({title: 'Login', content: 'test',
                                      closable: false, draggable: false})
      loginDialog.show()
  })
</script>
  <!--<form action="test" name="loginForm" method="post">-->
    <!--<input type="text" name="username" />-->
    <!--<input type="password" />-->
    <!--<input type="submit" value="Login" />-->
  <!--</form>-->
</body>
</html>
