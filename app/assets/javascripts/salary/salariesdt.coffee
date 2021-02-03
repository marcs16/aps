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
  $('#salaries-datatable').dataTable
    processing: true
    serverSide: true
    language: {
        url: I18nDatatable(abbr)
    }
    ajax:
      url: $('#salaries-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'employe'}
      {data: 'type_of_salary'}
      {data: 'basic_hour'}
      {data: 'basic_day'}
      {data: 'basic_month'}
      {data: 'average_payment'}
      {data: 'last_basic'}
      {data: 'last_increase_date'}
      {data: 'bank'}
      {data: 'links'}
    ]
