class MaintainceDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view,  :edit_device_maintaince_path, :device_maintaince_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

 def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      done_by:  {source: 'Maintaince.user_id', cond: :like, searchable:true, orderable: true},
      name:     { source: 'Maintaince.name', cond: :like, searchable: true, orderable: true },
      description:        { source: 'Maintaince.description', cond: :like, searchable: true, orderable: true },
      date:         { source: 'Maintaince.data', searchable: false, orderable: true },
      device:    { source: 'Maintaince.device_id', searchable: false, orderable: true },

    }
  end

  def data
    records.map do |record|
      {
        done_by: user_name(record.user_id),
        name: record.name, 
        description: record.description, 
        date: record.date, 
        device: device_name(record.device_id), 
        links: actions(record).html_safe
      }
    end
  end

  
  def get_raw_records
    Maintaince.where(device_id: options[:device].id)
         
  end

  private 
  def user_name(usr)
    name = User.where(id: usr).select(:full_name)
    return name[0][:full_name]
  end

  def device_name(dev)
    dev_name = Device.where(id: dev).select(:name)
   
    return dev_name[0][:name]
  end

  def actions(record)
    maintaince = record
    device = Device.where(id: record.device_id)
    sarta = "<a href ='#{edit_device_maintaince_path(record.device_id,record)}'><i class='fa fa-edit'></i></a>"
    sarta +=  " | <a href ='#{device_maintaince_path(record.device_id,record)}'><i class='fa fa-eye'></i></a>"
  end
end