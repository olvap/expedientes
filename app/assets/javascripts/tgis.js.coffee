$ ->
  $('#tgi_titular_id').
    tokenInput '/admin/people.json',
      queryParam: 'q[name_sw]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" +  item.name + " doc: " + item.doc + "</li>"
      prePopulate: $('#tgi_titular_id').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese el contribuyentes que quiere incluir'
      noResultsText: "No existe contribuyente"
      tokenLimit: 1

  $('#tgi_responsable_id').
    tokenInput '/admin/people.json',
      queryParam: 'q[name_sw]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" +  item.name + " doc: " + item.doc + "</li>"
      prePopulate: $('#tgi_responsable_id').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese el contribuyentes que quiere incluir'
      noResultsText: "No existe contribuyente"
      tokenLimit: 1
