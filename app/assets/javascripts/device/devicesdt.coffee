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
  $('#devices-datatable').dataTable
    destroy: true
    processing: true
    serverSide: true
    language: {
        url: I18nDatatable(abbr)
    }
    ajax:
      url: $('#devices-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'owner'}
      {data: 'name'}
      {data: 'type_of_device'}
      {data: 'number'}
      {data: 'operative_system'}
      {data: 'processor'}
      {data: 'memory'}
      {data: 'mac'}
      {data: 'links'}
    ]
  