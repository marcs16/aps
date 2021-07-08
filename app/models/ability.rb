# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :show, :update, to: :cru
    alias_action :read, :show, to: :resh
    alias_action :read, :update, to: :reup
    alias_action :read, :show, :update, to: :reshup
        user ||= User.new
        if user.is_gerente?
          can :resh, User
          can :disabled_users_index, User
          can :resh, Salary
          can :resh, Vacation
          can :resh, Contract
          can :resh, Device
          can :report_devices, Device
          can :resh, Maintaince
          can :export_maintainces, Maintaince
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_subgerente?
          can :resh, User
          can :disabled_users_index, User
          can :resh, Salary
          can :resh, Vacation
          can :resh, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_cooradmin_fin?
          can :cru, User
          can :disabled_users_index, User
          can :disable_user, User
          can :enable_user, User
          can :resh, Salary
          can :resh, Vacation
          can :resh, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end
        elsif user.is_coorcomer_soc?
          can :resh, User
          can :disabled_users_index, User
          can :resh, Salary
          can :resh, Vacation
          can :resh, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_coortec_ambac?
          can :resh, User
          can :disabled_users_index, User
          can :resh, Salary
          can :resh, Vacation
          can :resh, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_coortec_ambas?
          can :resh, User
          can :disabled_users_index, User
          can :resh, Salary
          can :resh, Vacation
          can :resh, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_prof_contratacion?
          can :resh, User
          can :resh, Salary
          can :resh, Vacation
          can :cru, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_prof_proyectos?
          can :resh, User
          can :resh, Salary
          can :resh, Vacation
          can :resh, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_prof_sig?
          can :resh, User
          can :resh, Salary
          can :resh, Vacation
          can :resh, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_prof_tic?
          can :resh, User
          can :disabled_users_index, User
          can :disable_user, User
          can :resh, Salary
          can :resh, Vacation
          can :resh, Contract
          can :resh, Device
          can :report_devices, Device
          can :resh, Maintaince
          can :export_maintainces, Maintaince
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_aux_sst?
          can :resh, User
          can :resh, Salary do |salary|
            salary.user_id = user.id
          end
          can :resh, Vacation do |vacation|
            vacation.user_id = user.id
          end
          can :resh, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_aux_gesdoc?
          can :resh, User
          can :resh, Salary do |salary|
            salary.user_id = user.id
          end
          can :resh, Vacation do |vacation|
            vacation.user_id = user.id
          end
          can :resh, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_aux_th?
          can :cru, User
          can :disable_user, User
          can :disabled_users_index, User
          can :enable_user, User
          can [:cru,:show], Salary
          can [:cru,:show], Vacation
          can :resh, Contract
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_aux_comercial?
          can :resh, User
          can :resh, Salary do |salary|
            salary.user_id = user.id
          end
          can :resh, Vacation do |vacation|
            vacation.user_id = user.id
          end
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_aux_servgen?
          can :resh, User
          can :resh, Salary do |salary|
            salary.user_id = user.id
          end
          can :resh, Vacation do |vacation|
            vacation.user_id = user.id
          end
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_aux_recaudo?
          can :resh, User
          can :resh, Salary do |salary|
            salary.user_id = user.id
          end
          can :resh, Vacation do |vacation|
            vacation.user_id = user.id
          end
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_aux_almacen?
          can :resh, User
          can :resh,  Salary do |salary|
            salary.user_id = user.id
          end
          can :resh, Vacation do |vacation|
            vacation.user_id = user.id
          end
          can :resh, Device
          can :report_devices, Device
          can :resh, Maintaince
          can :export_maintainces, Maintaince
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_conductor?
          can :resh,  Salary do |salary|
            salary.user_id = user.id
          end
          can :resh, Vacation do |vacation|
            vacation.user_id = user.id
          end
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_operario_pta?
          can :resh,  Salary do |salary|
            salary.user_id = user.id
          end
          can :resh, Vacation do |vacation|
            vacation.user_id = user.id
          end
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_operario_rl?
          can :resh,  Salary do |salary|
            salary.user_id = user.id
          end
          can :resh, Vacation do |vacation|
            vacation.user_id = user.id
          end
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end

        elsif user.is_operario_br?
          can :resh,  Salary do |salary|
            salary.user_id = user.id
          end
          can :resh, Vacation
          can :resh, Event
          can :update, Event do |event|
            event.user_id == user.id
          end
      end

end
  #def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  #end
end
