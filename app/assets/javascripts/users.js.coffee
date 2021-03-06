//= require jquery.tokeninput
$ ->
  $('#admin_user_roles_tokens').
    tokenInput '/admin/roles.json',
      queryParam: 'q[name_like]'
      crossDomain: false
      prePopulate: $('#admin_user_roles_tokens').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese los roles que desea incluir'
      noResultsText: "No existe este rol"

  $('#admin_user_people_tokens').
    tokenInput '/admin/people.json',
      queryParam: 'q[name_sw]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" + item.name + ", " + item.doc + "</li>"
      prePopulate: $('#admin_user_person_tokens').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese la persona que quiere incluir'
      noResultsText: "No existe esta Persona"
      tokenLimit: 1
