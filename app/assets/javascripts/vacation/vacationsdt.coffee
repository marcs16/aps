window.vacationsdt = do ->
  validate_datatable = (dom_element) ->
    if $.fn.DataTable.isDataTable dom_element
      $(dom_element).DataTable().destroy()
      $('tbody',dom_element).empty()

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
      columns: [
        {data: 'employe'}
        {data: 'laborated_period'}
        {data: 'end_of_laborated_period'}
        {data: 'exit_day'}
        {data: 'entry_day'}
        {data: 'last_vacations'}
        {data: 'status'}
        {data: 'links'}
      ]

  {
    ajax_datatable: create_ajax_datatable
  }
