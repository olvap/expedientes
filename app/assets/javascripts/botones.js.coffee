$ ->

  $( "#utility_nav a[href$='admin']").button({icons: {primary: "ui-icon-mail-closed"},text: false});

  $( ".view_link" ).button({icons: {primary: "ui-icon-search"}});
  $( ".edit_link" ).button({icons: {primary: "ui-icon-pencil"}});
  $( ".delete_link" ).button({icons: {primary: "ui-icon-trash"}});

  $( ".member_link" ).parent().addClass("table_actions");

  $( "a[href$='lock']" ).button({icons: {primary: "ui-icon-locked"}});
  $( "a[href$='unlock']" ).button({icons: {primary: "ui-icon-unlocked"}});

  $( "a[href*='version']" ).button({icons: {primary: "ui-icon-arrowthick-1-w"}});
  $( "a[href$='history']" ).button({icons: {primary: "ui-icon-folder-collapsed"}});

  $( "#sidebar a[href*='admin_users']" ).button({icons: {primary: "ui-icon-person"}});

  $( "#sidebar a[href*='topics']" ).button({icons: {primary: "ui-icon-search"}});
  $( "#sidebar a[href$='edit']" ).button({icons: {primary: "ui-icon-pencil"}});
