$ ->
  $('#maintainces-datatable').dataTable
    destroy: true
    processing: true
    serverSide: true
    language: {
        url: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
    }
    ajax:
      url: $('#maintainces-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'done_by'}
      {data: 'name'}
      {data: 'description'}
      {data: 'date'}
      {data: 'device'}
      {data: 'links'}
    ]
  