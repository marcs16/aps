module ApplicationHelper
	def options_for_type_of_document
    	['Cedula de ciudadania','Cedula de extranjeria',
    	'Pasaporte']
	end
	# Name model singular
	def model_name_singular(model)
		model.model_name.human
	end

	# Name model plural
	def model_name_plural(model)
		model.model_name.human(:count => 2)
	end
end
