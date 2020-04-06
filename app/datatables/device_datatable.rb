class DeviceDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      user: {source: "User.full_name", cond: :like,serchable: true, orderable: true},
      name: {source: "Device.name", cond: :like,serchable: true, orderable: true},
      type_of_device: {source: "Device.type_of_Device", cond: :like,serchable: true, orderable: true},
      number: {source: "Device.number", cond: :like,serchable: true, orderable: true},
      operative_system: {source: "Device.operative_system", cond: :like,serchable: true, orderable: true},
      processor: {source: "Device.processor", cond: :like,serchable: true, orderable: true},
      memory: {source: "Device.memory", cond: :like,serchable: true, orderable: true},
      mac: {source: "Device.mac", cond: :like,serchable: true, orderable: true}
  
    }
    
  end

  def data
    records.map do |record|
      {
        user: record.user.full_name;
        name: record.name;
        type_of_device: record.type_of_device,
        number: record.number,
        operative_system: record.operative_system,
        processor: record.processor,
        memory: record.memory,
        mac: record.mac
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
  end

end
