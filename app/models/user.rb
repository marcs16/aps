class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :devices, :dependent => :delete_all
  has_many :maintainces, :dependent => :delete_all
  has_many :salaries, :dependent => :destroy

# filter for select people to notify after a meeting has been programmed
  scope :telephoned, ->(name) { where("full_name = ?", name) }

  def is_gerente?
    if self.position == 'GERENTE'
      return true
    end
  end

  def is_subgerente?
    if self.position == 'SUBGERENTE'
      return true
    end
  end

  def is_cooradmin_fin?
    if self.position == 'COORDINADOR ADMINISTRATIVO Y FINANCIERO'
      return true
    end
  end

  def is_coorcomer_soc?
    if self.position == 'COORDINADOR COMERCIAL Y SOCIAL'
      return true
    end
  end

  def is_coortec_ambac?
    if self.position == 'COORDINADOR TECNICO Y AMBIENTAL ACUEDUCTO Y ALCANTARILLADO'
      return true
    end
  end

  def is_coortec_ambas?
    if self.position == 'COORDINADOR TECNICO Y AMBIENTAL ASEO'
      return true
    end
  end

  def is_prof_contratacion?
    if self.position == 'PROFESIONAL CONTRATACION'
      return true
    end
  end

  def is_prof_proyectos?
    if self.position == 'PROFESIONAL DE PROYECTOS'
      return true
    end
  end

  def is_prof_sig?
    if self.position == 'PROFESIONAL DEL SISTEMA INTEGRADO DE GESTION'
      return true
    end
  end

  def is_prof_tic?
    if self.position == 'PROFESIONAL TECNOLOGÍA TIC'
      return true
    end
  end

  def is_aux_sst?
    if self.position == 'AUXILIAR DE SEGURIDAD Y SALUD EN EL TRABAJO'
      return true
    end
  end

  def is_aux_gesdoc?
    if self.position == 'AUXILIAR DE GESTIÓN DOCUMENTAL'
      return true
    end
  end

  def is_aux_th?
    if self.position == 'AUXILIAR DE TALENTO HUMANO'
      return true
    end
  end

  def is_aux_comercial?
    if self.position == 'AUXILIAR COMERCIAL Y SOCIAL'
      return true
    end
  end

  def is_aux_servgen?
    if self.position == 'AUXILIAR DE SERVICIOS GENERALES'
      return true
    end
  end

  def is_aux_recaudo?
    if self.position == 'AUXILIAR DE RECAUDO'
      return true
    end
  end

  def is_aux_almacen?
    if self.position == 'AUXILIAR DE ALMACEN'
      return true
    end
  end

  def is_conductor?
    if self.position == 'CONDUCTOR'
      return true
    end
  end

  def is_operario_pta?
    if self.position == 'OPERARIO DE PLANTA DE TRATAMIENTO DE AGUA'
      return true
    end
  end

  def is_operario_rl?
    if self.position == 'OPERARIO DE REDES Y LECTURA'
      return true
    end
  end

  def is_operario_br?
    if self.position == 'OPERARIO DE BARRIDO Y RECOLECCIÓN'
      return true
    end
  end
end
