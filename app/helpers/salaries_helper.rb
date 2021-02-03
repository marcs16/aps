module SalariesHelper
  def options_for_type_of_salary
      ['INTEGRAL','PARCIAL']
  end

  def options_for_way_to_pay
      ['CHEQUE','EFECTIVO','TRANSFERENCIA']
  end

  def options_for_bank
      ['BANCOLOMBIA', 'DAVIVIENDA']
  end
  def options_for_type_of_bank_account
      ['AHORROS','CORRIENTE']
  end

  def options_for_operative_system
    ['Linux 32 bits', 'Linux 64 bits','MacOs 64bits',
    'Windows 8 32 bits', 'Windows 8 64 bits',
    'Windows 10 32 bits', 'Windows 10 64 bits','Otro',
    'No tiene'
     ]
  end

end
