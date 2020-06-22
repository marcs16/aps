# Call to the data tables and initialization of the variables
window.callDatatables = do ->
  validate_datatable = (dom_element) ->

  I18nDatatable = (language) ->
    url_languages =
      es: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
      en: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/English.json'

    if url_languages[language] = 'es'
      url = 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/English.json'
    else
      url = url_languages[language]

    url

  create_ajax_datatable = (columns, dom_element, columnDefs, i18n = 'es') ->
    validate_datatable dom_element

    $(dom_element).dataTable
      destroy: true
      processing: true
      serverSide: true
      ajax: $(dom_element).data('source')
      pagingType: 'full_numbers'
      columns: columns
      columnDefs: columnDefs or []
      language: {
        url: I18nDatatable(i18n)
      }

  {
    ajax_datatable: create_ajax_datatable
  }