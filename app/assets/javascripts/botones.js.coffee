$ ->
  $( "#utility_nav a[href$='new']" ).button({icons: {primary: "ui-icon-pencil"},text: false});
  $( "#utility_nav a[href$='inbox']" ).button({icons: {primary: "ui-icon-mail-closed"},text: false});

  $( ".view_link" ).button({icons: {primary: "ui-icon-search"}});
  $( ".edit_link" ).button({icons: {primary: "ui-icon-pencil"}});
  $( ".delete_link" ).button({icons: {primary: "ui-icon-trash"}});

  $( ".member_link" ).parent().addClass("table_actions");
