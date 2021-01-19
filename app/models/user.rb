class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :devices, :dependent => :delete_all
  has_many :maintainces, :dependent => :delete_all


  def is_gerente_general?
    if self.position == 'Gerente General'
      return true
    end
  end

  def is_lector?
    if self.position == 'Lector'
      return true
    end
  end


end
