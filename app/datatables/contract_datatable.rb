class ContractDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      code:   {source: 'Contract.code', cond: :like, searchable: true, orderable: true},
      contractor:     { source: 'Contract.contractor', cond: :like, searchable: true, orderable: true },
      object:         { source: 'Contract.object', cond: :like, searchable: true, orderable: true },
      supervisor:     { source: 'Contract.supervisor', searchable: false, orderable: true },
      initiation_act: { source: 'Contract.initiation_act', searchable: false, orderable: true },
      dead_line:      {source: 'Contract.dead_line',searchable:false, orderable: true},
      value:          { source: 'Contract.value', cond: :like, searchable: false, orderable: true },
      executed_value: { source: 'Contract.executed_value', cond: :like searchable: false, orderable: true },
      execution_rate: { source: 'Contract.execution_rate', cond: :like searchable: false, orderable: true },
      observations:   { source: 'Contract.observations', cond: :like searchable: false, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        
        code: record.oode
        contractor: record.contractor
        object: record.object
        supervisor: record.supervisor
        initiation_act: record.initiation_act
        dead_line: record.dead_line
        value: record.value
        executed_value: record.executed_value
        execution_rate: record.execution_rate
        observations: record.observations
        links: actions(record).html_safe
      }
    end
  end

  
  def get_raw_records
    Contract.all
         
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


