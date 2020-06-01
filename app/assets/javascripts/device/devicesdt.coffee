$ ->
  $('#devices-datatable').dataTable
    destroy: true
    processing: true
    serverSide: true
    language: {
        url: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
    }
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
  