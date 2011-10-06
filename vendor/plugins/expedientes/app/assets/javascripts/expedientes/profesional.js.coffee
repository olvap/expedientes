//= require jquery.tokeninput

$ ->
  $('#profesional_person_id').
    tokenInput '/personas/people.json',
    # NOTE: esto esta hardcodeado porque no se puede tener acceso a los helpers (helper.personas.new_people_path(:as => :json))
      queryParam: 'search[name_like]'
      crossDomain: false
      prePopulate: $('#profesional_person_id').data('pre')
      searchingText: 'Buscando...'
      hintText: 'Ingrese el nombre del comprador'
      noResultsText: "Esta persona no está registrada"
