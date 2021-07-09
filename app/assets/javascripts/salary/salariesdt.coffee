window.salariesdt = do ->
  validate_datatable = (dom_element) ->
    if $.fn.DataTable.isDataTable dom_element
      $(dom_element).DataTable().destroy()
      $('tbody',dom_element).empty()

  abbr = $('.change_language').data 'abbr'
  I18nDatatable = (language) ->
    url_languages =
      es: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
      en: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/English.json'

    if language == 'en'
      url = 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/English.json'
    else
      url = 'https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json'

    url

   create_ajax_datatable = (dom_element) ->
    validate_datatable dom_element

    $(dom_element).dataTable
      processing: true
      serverSide: true
      language: {
          url: I18nDatatable(abbr)
      }
      ajax: $(dom_element).data('source')
      pagingType: 'full_numbers'
      columns:  [
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

  {
    ajax_datatable: create_ajax_datatable
  }
