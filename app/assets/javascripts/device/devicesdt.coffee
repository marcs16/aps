$ ->
  $('#devices-datatable').dataTable
    processing: true
    serverSide: true
    ajax:
      url: $('#users-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'name'}
      {data: 'type_of_device'}
      {data: 'number'}
      {data: 'operative_system'}
      {data: 'processor'}
      {data: 'memory'}
      {data: 'mac'}
      {data: 'links'}
    ]
  