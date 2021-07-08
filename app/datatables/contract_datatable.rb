class ContractDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegator :@view, :truncate

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

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
      executed_value: { source: 'Contract.executed_value', cond: :like, searchable: false, orderable: true },
      execution_rate: { source: 'Contract.execution_rate', cond: :like, searchable: false, orderable: true },
      observations:   { source: 'Contract.observations', cond: :like, searchable: false, orderable: true },
      status:   { source: 'Contract.status', cond: :like, searchable: true, orderable: true },
    }
  end

  def data
    records.map do |record|
      {

        code: record.code,
        contractor: record.contractor,
        object: truncate(record.object, length:30),
        supervisor: record.supervisor,
        initiation_act: record.initiation_act,
        dead_line: record.dead_line,
        value: record.value,
        executed_value: record.executed_value,
        execution_rate: record.execution_rate,
        observations: record.observations,
        status: record.status,
        links: actions(record).html_safe
      }
    end
  end


  def get_raw_records
    get_raw_by_position(options[:current_user])
  end


  private

  def actions(record)
    get_actions_by_position(options[:current_user], record)
  end

  def get_actions_by_position(user, record)
    if  user.is_prof_contratacion?
      sarta = "&nbsp;&nbsp<a href ='#{options[:edit].gsub('_',record.id.to_s)}'><i class='fa fa-edit'></i></a>"
      sarta +=  " | <a href ='#{options[:show].gsub('_',record.id.to_s)}'><i class='fa fa-eye'></i></a>"

    elsif user.is_gerente? || user.is_subgerente? || user.is_cooradmin_fin? ||
      user.is_coorcomer_soc? || user.is_coortec_ambac? || user.is_coortec_ambas? ||
      user.is_prof_contratacion? || user.is_prof_proyectos? ||
      user.is_prof_sig? || user.is_prof_tic? || user.is_aux_sst? ||
      user.is_aux_gesdoc? || user.is_aux_th?
      sarta =  "&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp<a href ='#{options[:show].gsub('_',record.id.to_s)}'><i class='fa fa-eye'></i></a>"
    end

  end

  def get_raw_by_position(user)
    if  user.is_prof_contratacion? || user.is_gerente? || user.is_subgerente? || user.is_cooradmin_fin? ||
      user.is_coorcomer_soc? || user.is_coortec_ambac? || user.is_coortec_ambas? ||
      user.is_prof_contratacion? || user.is_prof_proyectos? ||
      user.is_prof_sig? || user.is_prof_tic? || user.is_aux_sst? ||
      user.is_aux_gesdoc? || user.is_aux_th?
      return Contract.all
    end
  end
end
