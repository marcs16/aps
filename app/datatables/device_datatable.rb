class DeviceDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :edit_device_path,:device_path,:current_user

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      user: {source: "User.full_name", cond: :like,serchable: true, orderable: true},
      name: {source: "Device.name", cond: :like,serchable: true, orderable: true},
      type_of_device: {source: "Device.type_of_Device", cond: :like,serchable: true, orderable: true},
      number: {source: "Device.number", cond: :like,serchable: true, orderable: true},
      operative_system: {source: "Device.operative_system", cond: :like,serchable: true, orderable: true},
      processor: {source: "Device.processor", cond: :like,serchable: true, orderable: true},
      memory: {source: "Device.memory", cond: :like,serchable: true, orderable: true},
      mac: {source: "Device.mac", cond: :like,serchable: true, orderable: true},
    }
    
  end

  def data
    records.map do |record|
      {
        user: record.user.full_name,
        name: record.name,
        type_of_device: record.type_of_device,
        number: record.number,
        operative_system: record.operative_system,
        processor: record.processor,
        memory: record.memory,
        mac: record.mac,
        links: actions(record).html_safe,
      }
    end
  end
  private 
    def get_raw_records
      Device.all
    end

    def actions(record)
      sarta = "<a href ='#{edit_device_path(record)}'><i class='fa fa-edit'></i></a>"
      sarta +=  " | <a href ='#{device_path(record)}'><i class='fa fa-eye'></i></a>"
    end

end
