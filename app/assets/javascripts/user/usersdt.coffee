$ ->
  
  $('#users-datatable').dataTable
    processing: true
    serverSide: true
    language: {
        url: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
    }
    ajax:
      url: $('#users-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'full_name'}
      {data: 'type_of_id'}
      {data: 'number_of_id'}
      {data: 'position'}
      {data: 'email'}
      {data: 'telephone'}
      {data: 'date_of_birth'}
      {data: 'working_since'}
      {data: 'links'}
    ]
    
  