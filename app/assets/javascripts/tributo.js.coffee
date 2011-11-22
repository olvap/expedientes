//= require jquery.tokeninput
$ ->
  $('#tributo_responsables_tokens').
    tokenInput '/admin/people.json',
      queryParam: 'q[name_like]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" +  item.name + " doc: " + item.doc + "</li>"
      prePopulate: $('#tributo_responsables_tokens').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese la persona que quiere incluir como responsable'
      noResultsText: "No existe esta persona"

  $('#tributo_titulares_tokens').
    tokenInput '/admin/people.json',
      queryParam: 'q[name_like]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" +  item.name + " doc: " + item.doc + "</li>"
      prePopulate: $('#tributo_titulares_tokens').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese la persona que quiere incluir como titular'
      noResultsText: "No existe esta persona"


