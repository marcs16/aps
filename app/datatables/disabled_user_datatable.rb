class DisabledUserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view,  :users_reset_password_path,  :user_enable_path , :t

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
      number_of_id:         { source: 'User.number_of_id', searchable: true, orderable: true },
      position:    { source: 'User.position', searchable: true, orderable: true },
      email:  {source: 'User.email',searchable: true, orderable: true},
      telephone:        { source: 'User.telephone', cond: :like, searchable: true, orderable: true },
      disbled_since: {source: 'User.disabled_since', cond: :like, searchable: true, orderable: true},
      date_of_birth:         { source: 'User.date_of_birth', searchable: false, orderable: true },

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
        working_since: record.disabled_since,
        links: actions(record).html_safe
      }
    end
  end

  def get_raw_records
    User.where(can_login: 'no')

  end

  private
  def actions(record)
    get_actions_by_position(options[:current_user], record)
  end

  def get_actions_by_position(user, record)
    if user.is_cooradmin_fin? || user.is_aux_th?
        sarta = " <a href ='#{ user_enable_path(record)}'><i class='fa fa-toggle-on'></i></a>"

    elsif user.is_gerente? || user.is_subgerente? || user.is_coorcomer_soc? ||
      user.is_coortec_ambac? || user.is_coortec_ambas? ||
      user.is_prof_contratacion? || user.is_prof_tic? ||
      user.is_prof_proyectos? || user.is_prof_sig? || user.is_aux_sst? ||
      user.is_aux_gesdoc? || user.is_aux_comercial? || user.is_aux_servgen? ||
      user.is_aux_recaudo? || user.is_aux_almacen?
        sarta =  "&nbsp;&nbsp&nbsp;<a>#{t('app_common.tables.no_options')}</a>"
    end
  end




end
