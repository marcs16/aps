$ ->
  $('#maintainces-datatable').dataTable
    destroy: true
    processing: true
    serverSide: true
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
  