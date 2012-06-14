//= require jquery.tokeninput
$ ->
  $('#catastro_people_tokens').
    tokenInput '/admin/people.json?scope=profesionales',
      queryParam: 'q[name_like]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" +  item.name + " doc: " + item.doc + "</li>"
      prePopulate: $('#catastro_people_tokens').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese los roles que desea incluir'
      noResultsText: "No existe esta persona"

$ ->
  $('#edificacion_privada_people_tokens').
    tokenInput '/admin/people.json?scope=profesionales',
      queryParam: 'q[name_like]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" +  item.name + " doc: " + item.doc + "</li>"
      prePopulate: $('#catastro_people_tokens').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese los roles que desea incluir'
      noResultsText: "No existe esta persona"

$ ->
  $('#rentas_people_tokens').
    tokenInput '/admin/people.json',
      queryParam: 'q[name_like]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" +  item.name + " doc: " + item.doc + "</li>"
      prePopulate: $('#catastro_people_tokens').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese los roles que desea incluir'
      noResultsText: "No existe esta persona"
