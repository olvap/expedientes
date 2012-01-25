$ ->
  $('#address_localidad_id').
    tokenInput '/admin/localidads.json',
      queryParam: 'q[name_sw]'
      crossDomain: false
      resultsFormatter: (item)->"<li>" + item.name + " postal:" + item.postal + "</li>"
      prePopulate: $('#address_localidad_id').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese la localidad que quiere incluir'
      noResultsText: "No existe esta localidad"
      tokenLimit: 1
