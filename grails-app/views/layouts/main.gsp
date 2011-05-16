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
    var menus = ${menus}
    function showMenus(elem, data) {
        var sMenu = $('#subItems');
        sMenu.bind('mouseover', function() {
            var qName = 'close-menu'+elem.data('pre-menu').data('menuId');
            sMenu.clearQueue(qName);
        });
        sMenu.bind('mouseout', function() {
            var qName = 'close-menu'+elem.data('pre-menu').data('menuId');
            sMenu.delay(500, qName);
            sMenu.queue(qName, function() {sMenu.slideToggle(500);}).dequeue(qName);
        });
        $.each(data.children, function (index, value) {
            var item = $('<td>').data({'children': value.children, 'menuId': value.id});
            item.text(value.name).bind('mouseover', function () {
                var sub = $('#subItems');
                var pMenu = elem.data('pre-menu');
                if (pMenu != item) {
                    sub.css({'display': 'none'});
                    if (pMenu) {
                        sub.clearQueue('close-menu'+pMenu.data('menuId'));
                    }
                } else {
                    if (sub.css('display') != 'none') {
                        sub.clearQueue('close-menu'+pMenu.data('menuId'));
                        return ;
                    }
                }
                elem.data('pre-menu', item);
                sub.empty();
                sub.clearQueue('close-menu'+item.data('menuId'));
                $.each(item.data('children'), function(i, v) {
                    sub.append('<div class="subItem">'+v.name+'</div>');
                })
                if (!$.isEmptyObject(item.data('children'))) {
                    var w = sub.width() >= $(this).outerWidth() + 30 ? sub.width() : $(this).outerWidth() + 30;
                    sub.css({width: w, 'top': item.outerHeight() + item.offset().top - 1, 'left': item.offset().left});
                    sub.slideDown(500);
                }
            });
            item.bind('mouseout', function() {
                var sub = $('#subItems');
                if ($.isEmptyObject(item.data('children'))) {
                    sub.css('display', 'none');
                    return ;
                }
                var qName = 'close-menu'+item.data('menuId');
                sub.delay(500, qName);
                sub.queue(qName, function() {sub.slideToggle(500);}).dequeue(qName);
            });
            elem.find('tr').append(item);
        })
        elem.find('td:first').addClass('firstItem').end().find('td:last').addClass('lastItem')
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
        <div id="subItems" style="background-color: #EFEFEF; display: none; z-index: 1000; position: absolute; border: 1px solid black;"></div>
        <table width="100%" height="100%" border="0" class="normal">
          <tr>
            <td><a class="appName" href="${application.contextPath}">ESM</a></td>
            <td width="100%"><table id="menus" class="normal" cellpadding="0" cellspacing="0" style="width: auto;"><tr></tr></table></td>
          </tr>
        </table>
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