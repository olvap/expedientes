//= require jquery.tokeninput
$ ->
  $('#bromatologia_person_id').
    tokenInput '/admin/people.json',
      queryParam: 'q[name_like]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" +  item.name + " doc: " + item.doc + "</li>"
      prePopulate: $('#bromatologia_person_id').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese la persona que quiere incluir'
      noResultsText: "No existe esta persona"
      tokenLimit: 1
