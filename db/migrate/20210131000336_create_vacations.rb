class CreateVacations < ActiveRecord::Migration[5.2]
  def change
    create_table :vacations do |t|
      t.date :laborated_period
      t.date :end_of_laborated_period
      t.date :period_until_deductions
      t.integer :business_days
      t.integer :holidays
      t.date :entry_day
      t.date :exit_day
      t.date :last_vacations
      t.integer :acumulated_periods
      t.integer :suspension_days
      t.date :date_until_suspension
      t.string :cost_center
      t.string :status
      t.text :observations
      t.string :files
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
