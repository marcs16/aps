window.disabledusersdt = do ->
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
        {data: 'full_name'}
        {data: 'type_of_id'}
        {data: 'number_of_id'}
        {data: 'position'}
        {data: 'email'}
        {data: 'telephone'}
        {data: 'date_of_birth'}
        {data: 'disabled_since'}
        {data: 'links'}
      ]

  {
    ajax_datatable: create_ajax_datatable
  }
