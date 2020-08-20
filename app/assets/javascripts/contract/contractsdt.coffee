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
  $('#contracts-datatable').dataTable
    processing: true
    serverSide: true
    language: {
        url: I18nDatatable(abbr)
    }
    ajax:
      url: $('#contracts-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'code'}
      {data: 'contractor'}
      {data: 'object'}
      {data: 'supervisor'}
      {data: 'initiation_act'}
      {data: 'dead_line'}
      {data: 'value'}
      {data: 'executed_value'}
      {data: 'execution_rate'}
      {data: 'observations'}
      {data: 'status'}
      {data: 'links'}
    ]
    
  
      