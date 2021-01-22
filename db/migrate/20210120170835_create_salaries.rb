class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.string :type_of_salary
      t.integer :social_benefits
      t.integer :basic_month
      t.integer :basic_day
      t.integer :basic_hour
      t.integer :average_payment
      t.integer :last_basic
      t.date :last_increase_date
      t.string :way_to_pay
      t.string :bank
      t.string :bank_number
      t.string :type_of_bank_account
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
