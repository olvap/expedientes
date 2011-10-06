//= require jquery.tokeninput

$ ->
  $('#expediente_profesional_id').
    tokenInput '/expedientes/profesional.json',
    # NOTE: esto esta hardcodeado porque no se puede tener acceso a los helpers (helper.personas.new_people_path(:as => :json))
      queryParam: 'search[person_name_like]'
      crossDomain: false
      prePopulate: $('#expediente_profesional_id').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese el nombre del comprador'
      noResultsText: "Esta persona no está registrada"
