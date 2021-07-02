class DisableUserDatatable < AjaxDatatablesRails::ActiveRecord
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
    User.where.not(id: options[:current_user].id).where(can_login: 'no')

  end

  private
  def actions(record)
    if options[:current_user].is_gerente?
      sarta = " <a href ='#{ user_enable_path(record)}'><i class='fa fa-toggle-on'></i></a>"
    elsif options[:current_user].is_cooradmin_fin?
      sarta = " <a>No options</a>"
    end

  end
end
