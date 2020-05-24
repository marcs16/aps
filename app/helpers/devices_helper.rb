module DevicesHelper

	def options_for_type_of_device
    	['Teclado','Mouse',
    	'Pantalla','Computador']
 
	end

	def options_for_operative_system
		['Linux 32 bits', 'Linux 64 bits','MacOs 64bits', 
		'Windows 8 32 bits', 'Windows 8 64 bits',
		'Windows 10 32 bits', 'Windows 10 64 bits','Otro',
		'No tiene'
		 ]
	end

	def options_for_processor
		['Intel core i3 de tercera gen.','Intel core i3 de cuarta gen.',
		'Intel core i3 de quinta gen.', 'Intel core i3 de sexta gen.',
		'Intel core i3 de octava gen.', 'Intel core i3 de novena gen.',
		'Intel core i5 de tercera gen.','Intel core i5 de cuarta gen.',
		'Intel core i5 de quinta gen.', 'Intel core i5 de sexta gen.',
		'Intel core i5 de octava gen.', 'Intel core i5 de novena gen.',
		'Intel core i7 de tercera gen.','Intel core i7 de cuarta gen.',
		'Intel core i7 de quinta gen.', 'Intel core i7 de sexta gen.',
		'Intel core i7 de octava gen.', 'Intel core i7 de novena gen.',
		'Intel core i9 de tercera gen.','Intel core i9 de cuarta gen.',
		'Intel core i9 de quinta gen.', 'Intel core i9 de sexta gen.',
		'Intel core i9 de octava gen.', 'Intel core i9 de novena gen.',
		'Otro tipo de procesador intel','Procesador AMD','No tiene']
		
	end

	def options_for_memory
		['512MB DDR3', '1 GB DDR3',
		'2GB DDR3', '4GB DDR3', '8GB DDR3',
		'16GB DDR3', '32GB DDR3', '64GB DDR3',
		'512MB DDR4', '1 GB DDR4' ,'2GB DDR4', 
		'4GB DDR4', '8GB DDR4','16GB DDR4',
		 '32GB DDR4', '64GB DDR4', 'No tiene']
		
	end
		


end
