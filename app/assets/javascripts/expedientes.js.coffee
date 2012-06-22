//= require jquery.tokeninput
$ ->
  $('#expediente_people_tokens').
    tokenInput '/admin/people.json?scope=profesionales',
      queryParam: 'q[name_like]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" +  item.name + " doc: " + item.doc + "</li>"
      prePopulate: $('#catastro_people_tokens').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese los roles que desea incluir'
      noResultsText: "No existe esta persona"
