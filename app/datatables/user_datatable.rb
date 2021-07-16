class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view,  :users_reset_password_path, :user_disable_path, :user_enable_path,  :t

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end


  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      full_name:     { source: 'User.full_name', cond: :like, searchable: true, orderable: true },
      type_of_id:        { source: 'User.type_of_id', cond: :like, searchable: true, orderable: true },
      number_of_id:         { source: 'User.number_of_id', searchable: false, orderable: true },
      position:    { source: 'User.position', searchable: false, orderable: true },
      email:  {source: 'User.email',searchable:false, orderable: true},
      telephone:        { source: 'User.telephone', cond: :like, searchable: false, orderable: true },
      date_of_birth:         { source: 'User.date_of_birth', searchable: false, orderable: true },
      working_since:    { source: 'User.working_since', searchable: false, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        full_name: record.full_name,
        type_of_id: record.type_of_id,
        number_of_id: record.number_of_id,
        position: record.position,
        email: record.email,
        telephone: record.telephone,
        date_of_birth: record.date_of_birth,
        working_since: record.working_since,
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
    if user.is_cooradmin_fin? || user.is_aux_th?
      sarta =  "<a href ='#{options[:edit].gsub('_',record.id.to_s)}'> <i class='fa fa-edit'></i></a>"
      sarta +=  " | <a href ='#{users_reset_password_path(record)}'> <i class='fa fa-lock'></i></a>"
      sarta += " | <a data-confirm='#{t('app_common.tables.confirm') }' href ='#{ user_disable_path(record)}'><i class='fa fa-toggle-off'></i></a>"

    elsif user.is_gerente? || user.is_subgerente? || user.is_coorcomer_soc? ||
      user.is_coortec_ambac? || user.is_coortec_ambas? ||
      user.is_prof_contratacion? || user.is_prof_tic? ||
      user.is_prof_proyectos? || user.is_prof_sig? || user.is_aux_sst? ||
      user.is_aux_gesdoc? || user.is_aux_comercial? || user.is_aux_servgen? ||
      user.is_aux_recaudo? || user.is_aux_almacen?
        sarta =  "&nbsp;&nbsp&nbsp;<a>#{t('app_common.tables.no_options')}</a>"
    end
  end

  def get_raw_by_position(user)
    if  user.is_aux_th? || user.is_cooradmin_fin?
     User.where(can_login: 'si')

    elsif user.is_gerente? || user.is_subgerente? || user.is_coorcomer_soc? ||
      user.is_coortec_ambac? || user.is_coortec_ambas? ||
      user.is_prof_contratacion? || user.is_prof_tic?
      User.where(can_login: 'si')

    elsif user.is_prof_proyectos? || user.is_prof_sig? || user.is_aux_sst? ||
      user.is_aux_gesdoc? || user.is_aux_comercial? || user.is_aux_servgen? ||
      user.is_aux_recaudo? || user.is_aux_almacen?
      User.where(id: user.id)
    end
  end

end
