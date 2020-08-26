class Device < ApplicationRecord
	belongs_to :user
	has_many :maintainces, :dependent => :delete_all

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
		end

	end
end
