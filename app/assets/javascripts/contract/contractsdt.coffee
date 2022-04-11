window.contractsdt = do ->
  validate_datatable = (dom_element) ->
    if $.fn.DataTable.isDataTable dom_element
      $(dom_element).DataTable().destroy()
      $('tbody',dom_element).empty()

  I18nDatatable = (language) ->
    url_languages =
      es: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
      en: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/English.json'

    if language == 'en'
      url = url_languages['es']
    else
        url = url_languages['en']

    url

   create_ajax_datatable = (dom_element) ->
    validate_datatable dom_element

    abbr = $('.change_language').data 'abbr'
    $(dom_element).dataTable
      processing: true
      serverSide: true
      language: {
          url: I18nDatatable(abbr)
      }
      ajax: $(dom_element).data('source')
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
        {data: 'status'}
        {data: 'links'}
      ]

  {
    ajax_datatable: create_ajax_datatable
  }
