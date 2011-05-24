<html>
<head>
  <title><g:layoutTitle default="ESM" /></title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/themes/start/jquery-ui.css" type="text/css" media="all" />
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript"></script>
  <g:layoutHead />
  <g:javascript library="application" />
  <script type="text/javascript">
    var menus = ${session.menus}
    var appName = '${request.contextPath}'
    function clickOnItem() {
        window.location = window.location.protocol+"//"+window.location.host+appName+$(this).data('menuValue').action;
    }
    function showMenus(elem, data) {
        var menuTR = elem.find('tr');
        var closeSubMenu = function (m) {m.delay(300, 'close').queue('close', function() {m.hide(200)}).dequeue('close');}
        $.each(data.children, function (index, value) {
            var item = $('<td>').data({'menuValue': value, 'menuId': value.id});
            var subMenu = $('<div></div>').addClass('subItems').attr('id', 'sub-menu-'+item.data('menuId'));
            subMenu.bind('mouseover', function() {
                subMenu.clearQueue('close');
            }).bind('mouseout', function() {
                closeSubMenu(subMenu);
            }).appendTo('body');
            var addMouseOverClass = function () {$(this).addClass('menu-mouseOver')}
            var removeMouseOverClass = function () {$(this).removeClass('menu-mouseOver')}
            $.each(item.data('menuValue').children, function(i, v) {
                subMenu.append($('<div></div>').addClass('subItem').text(v.name)
                                .bind('mouseover', addMouseOverClass).bind('mouseout', removeMouseOverClass)
                                .bind('click', clickOnItem).data('menuValue', v)
                               );
                var w = subMenu.width() >= item.outerWidth() + 30 ? subMenu.width() : item.outerWidth() + 30;
                subMenu.css({width: w, 'top': item.outerHeight() + item.offset().top - 1, 'left': item.offset().left});
            });
            item.text(value.name).bind('mouseover', function () {
                if ($.isEmptyObject(item.data('menuValue').children)) return ;
                subMenu.clearQueue('close');
                var w = subMenu.width() >= item.outerWidth() + 30 ? subMenu.width() : item.outerWidth() + 30;
                subMenu.css({width: w, 'top': item.outerHeight() + item.offset().top - 1, 'left': item.offset().left})
                       .show(500);
            }).bind('mouseout', function() {
                closeSubMenu(subMenu);
            }).bind('mouseover', addMouseOverClass).bind('mouseout', removeMouseOverClass).bind('click', clickOnItem);
            menuTR.append(item);
        });
        menuTR.find('td:first').addClass('firstItem').end().find('td:last').addClass('lastItem');
    }

    $(function () {
        showMenus($('#menus'), menus)
    });
  </script>
</head>
<body>
  <div id="spinner" class="spinner" style="display:none;">
      <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
  </div>
  <table class="normal" width="100%" border="0" cellspacing="0" cellpadding="0" id="appShell" height="100%">
    <tr>
      <td id="appHead" width="100%">
        <table width="100%" height="100%" border="0" class="normal">
          <tr>
            <td><a class="appName" href="${application.contextPath}">ESM</a></td>
            <td width="100%"><table id="menus" class="normal" cellpadding="0" cellspacing="0" style="width: auto;"><tr></tr></table></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="100%" height="100%" valign="top">
        <g:layoutBody />
      </td>
    </tr>
  </table>
</body>
</html>