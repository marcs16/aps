$ ->
  abbr = $('.change_language').data 'abbr'
  I18nDatatable = (language) ->
    url_languages =
      es: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
      en: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/English.json'

    if language != 'en'
      url = 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/English.json'
    else
      url = 'https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json'

    url
  $('#disabled-users-datatable').dataTable
    processing: true
    serverSide: true
    language: {
        url: I18nDatatable(abbr)
    }
    ajax:
      url: $('#disabled-users-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'full_name'}
      {data: 'type_of_id'}
      {data: 'number_of_id'}
      {data: 'position'}
      {data: 'email'}
      {data: 'telephone'}
      {data: 'date_of_birth'}
      {data: 'working_since'}
      {data: 'links'}
    ]
    
  