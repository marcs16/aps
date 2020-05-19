$ ->
  $('#devices-datatable').dataTable
    destroy: true
    processing: true
    serverSide: true
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
  