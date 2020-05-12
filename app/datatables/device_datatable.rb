class DeviceDatatable < AjaxDatatablesRails::ActiveRecord

   def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      name:     { source: 'Device.name', cond: :like, searchable: true, orderable: true },
      type_of_device:        { source: 'Device.type_of_device', cond: :like, searchable: true, orderable: true },
      number:         { source: 'Device.number', searchable: false, orderable: true },
      operative_system:    { source: 'Device.operative_system', searchable: false, orderable: true },
      processor:  {source: 'Device.processor',searchable:false, orderable: true},
      memory:        { source: 'Device.memory', cond: :like, searchable: false, orderable: true },
      mac:         { source: 'Device.mac', searchable: false, orderable: true },
       

    }
  end

  def data
    records.map do |record|
      {
        name: record.name, 
        type_of_device: record.type_of_device, 
        number: record.number, 
        operative_system: record.operative_system, 
        processor: record.processor, 
        memory: record.memory, 
        mac: record.mac,
        links: actions(record).html_safe
      }
    end
  end

  
  def get_raw_records
    Device.all
         
  end

  private 
  def user_name(usr)
    name = User.where(id: usr).select(:full_name)
    @name = name
    return @name[0][:full_name]
  end
  
  def actions(record)
    sarta = "<a href ='#{options[:edit].gsub('_',record.id.to_s)}'><i class='fa fa-edit'></i></a>"
    sarta +=  " | <a href ='#{options[:show].gsub('_',record.id.to_s)}'><i class='fa fa-eye'></i></a>"
  end
end