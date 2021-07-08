module UsersHelper
	# documents of identifications
	def options_for_type_of_document
    	['Cedula de ciudadania','Cedula de extranjeria',
    	'Pasaporte']
	end
# options for secletor on own profile page
	def options_for_position_admin
		['GERENTE',
		'SUBGERENTE',
		'COORDINADOR ADMINISTRATIVO Y FINANCIERO',
		'COORDINADOR COMERCIAL Y SOCIAL ',
		'COORDINADOR TECNICO Y AMBIENTAL ACUEDUCTO Y ALCANTARILLADO',
		'COORDINADOR TECNICO Y AMBIENTAL ASEO']
	end

	# options for selector on edit general employes form
	def options_for_position
    	[
				'GERENTE',
				'SUBGERENTE',
				'COORDINADOR ADMINISTRATIVO Y FINANCIERO',
				'COORDINADOR COMERCIAL Y SOCIAL ',
				'COORDINADOR TECNICO Y AMBIENTAL ACUEDUCTO Y ALCANTARILLADO',
				'COORDINADOR TECNICO Y AMBIENTAL ASEO',
				'PROFESIONAL CONTRATACION',
				'PROFESIONAL DE PROYECTOS',
				'PROFESIONAL DEL SISTEMA INTEGRADO DE GESTION',
				'PROFESIONAL TECNOLOGÍA TIC',
				'AUXILIAR DE SEGURIDAD Y SALUD EN EL TRABAJO',
				'AUXILIAR DE GESTIÓN DOCUMENTAL',
				'AUXILIAR DE TALENTO HUMANO',
				'AUXILIAR COMERCIAL Y SOCIAL',
				'AUXILIAR DE SERVICIOS GENERALES',
				'AUXILIAR DE RECAUDO',
				'AUXILIAR DE ALMACEN',
				'CONDUCTOR',
				'OPERARIO DE PLANTA DE TRATAMIENTO DE AGUA',
				'OPERARIO DE REDES Y LECTURA',
				'OPERARIO DE BARRIDO Y RECOLECCIÓN'
    	]
	end

	# disabled options for selector on employes form if you have not  full permissions
	def options_for_position_disabled
		[
			'GERENTE',
			'SUBGERENTE',
			'COORDINADOR ADMINISTRATIVO Y FINANCIERO',
			'COORDINADOR COMERCIAL Y SOCIAL ',
			'COORDINADOR TECNICO Y AMBIENTAL ACUEDUCTO Y ALCANTARILLADO',
			'COORDINADOR TECNICO Y AMBIENTAL ASEO',
		]

	end
end
