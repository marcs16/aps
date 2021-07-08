class VacationDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
   # Declare strings in this format: ModelName.column_name
   # or in aliased_join_table.column_name format
   @view_columns ||= {
     employe: {source: 'Vacation.user_id', cond: :like, searchable: true, orderable: true},
     laborated_period:     { source: 'Vacation.laborated_period', cond: :like, searchable: true, orderable: true },
     end_of_laborated_period:        { source: 'Vacation.end_of_laborated_period', cond: :like, searchable: true, orderable: true },
     exit_day:         { source: 'Vacation.exit_day', searchable: false, orderable: true },
     entry_day:    { source: 'Vacation.entry_day', searchable: false, orderable: true },
     last_vacations:  {source: 'Vacation.last_vacations',searchable:false, orderable: true},
     status:         { source: 'Vacation.status', searchable: false, orderable: true },


   }
 end

 def data
   records.map do |record|
     {
       employe: user_name(record.user_id),
       laborated_period: record.laborated_period,
       end_of_laborated_period: record.end_of_laborated_period,
       exit_day: record.exit_day,
       entry_day: record.entry_day,
       last_vacations: record.last_vacations,
       status: record.status,
       links: actions(record).html_safe
     }
   end
 end


 def get_raw_records
   get_raw_by_position(options[:current_user])

 end

 private
 def user_name(usr)
   name = User.where(id: usr).select(:full_name)
   @name = name
   return @name[0][:full_name]
 end

 def actions(record)
   get_actions_by_position(options[:current_user], record)

 end

 def get_actions_by_position(user, record)
   if  user.is_aux_th?
     sarta = "<a href ='#{options[:edit].gsub('_',record.id.to_s)}'><i class='fa fa-edit'></i></a>"
     sarta +=  " | <a href ='#{options[:show].gsub('_',record.id.to_s)}'><i class='fa fa-eye'></i></a>"

   elsif user.is_gerente? || user.is_subgerente? || user.is_cooradmin_fin? ||
     user.is_coorcomer_soc? || user.is_coortec_ambac? || user.is_coortec_ambas? ||
     user.is_prof_contratacion? || user.is_prof_proyectos? ||
     user.is_prof_sig? || user.is_prof_tic? || user.is_aux_sst? ||
     user.is_aux_gesdoc? ||user.is_aux_comercial? || user.is_aux_servgen? ||
     user.is_aux_recaudo? ||user.is_aux_almacen? || user.is_conductor? ||
     user.is_operario_pta? || user.is_operario_rl?
     sarta =  "&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp<a href ='#{options[:show].gsub('_',record.id.to_s)}'><i class='fa fa-eye'></i></a>"
   end
 end

 def get_raw_by_position(user)
   if user.is_gerente? || user.is_subgerente? || user.is_cooradmin_fin? ||
     user.is_coorcomer_soc? || user.is_coortec_ambac? || user.is_coortec_ambas? ||
     user.is_prof_contratacion? || user.is_prof_tic? || user.is_aux_th? ||
     user.is_prof_proyectos?
     return Vacation.all

   elsif  user.is_prof_sig? || user.is_aux_sst? ||
     user.is_aux_gesdoc? || user.is_aux_comercial? || user.is_aux_servgen? ||
     user.is_aux_recaudo? || user.is_aux_almacen? || user.is_conductor? ||
     user.is_operario_pta? || user.is_operario_rl?
     return Vacation.where(user_id: user.id)
   end
 end
end
