class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :devices, :dependent => :delete_all
  has_many :maintainces, :dependent => :delete_all

  enum role: [:general_administrator, :administrator,:pqrsr, :simple_user]

  def is_general_administrator?
		self.role == 'general_administrator'
	end

  def is_administrator?
		self.role == 'administrator'
	end
  def  pqrsr?
		self.role == 'administrator'
	end

  def is_simple_user?
		self.role == 'simple_user'
	end
end
