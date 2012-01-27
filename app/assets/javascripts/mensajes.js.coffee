$ ->
  $('#mensaje_admin_user_id').
    tokenInput '/admin/admin_users.json',
      queryParam: 'q[email_like]'
      crossDomain: false
      propertyToSearch: "email"
      prePopulate: $('#mensaje_admin_user_id').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese el usuario al que desea mandar un mensaje'
      noResultsText: "No existe usuario"
      tokenLimit: 1
