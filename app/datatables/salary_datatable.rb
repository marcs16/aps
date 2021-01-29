class SalaryDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      employe:               {source: 'Salary.user_id',cond: :like, searchable: true, orderable: true },
      type_of_salary:     { source: 'Salary.type_of_salary', cond: :like, searchable: true, orderable: true },
      social_benefits:        { source: 'Salary.social_benefits', cond: :like, searchable: true, orderable: true },
      basic_hour:         { source: 'Salary.basic_hour', searchable: false, orderable: true },
      basic_day:    { source: 'Salary.basic_day', searchable: false, orderable: true },
      basic_month:  {source: 'Salary.basic_month',searchable:false, orderable: true},
      average_payment:        { source: 'Salary.average_payment', cond: :like, searchable: false, orderable: true },
      last_basic:         { source: 'Salary.last_basic', searchable: false, orderable: true },
      last_increase_date:    { source: 'Salary.last_increase_date', searchable: false, orderable: true },
      way_to_pay:        { source: 'Salary.way_to_pay', cond: :like, searchable: false, orderable: true },
      bank:         { source: 'Salary.bank', searchable: false, orderable: true },
      type_of_bank_account:    { source: 'Salary.type_of_bank_account', searchable: false, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        employe: user_name(record.user_id),
        type_of_salary: record.type_of_salary,
        basic_hour: record.basic_hour,
        basic_day: record.basic_day,
        basic_month: record.basic_month,
        average_payment: record.average_payment,
        last_basic: record.last_basic,
        last_increase_date: record.last_increase_date,
        way_to_pay: record.way_to_pay,
        bank: record.bank,
        bank_number: record.bank_number,
        links: actions(record).html_safe
      }
    end
  end

  def get_raw_records
    Salary.all

  end

  private


      def actions(record)
        sarta = "<a href ='#{options[:edit].gsub('_',record.id.to_s)}'><i class='fa fa-edit'></i></a>"
        sarta +=  " | <a href ='#{options[:show].gsub('_',record.id.to_s)}'><i class='fa fa-eye'></i></a>"
      end

      def user_name(usr)
        name = User.where(id: usr).select(:full_name)
        @name = name
        return @name[0][:full_name]
      end

  end
