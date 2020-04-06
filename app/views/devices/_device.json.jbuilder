json.extract! device, :id, :name, :type_of_device, :number, :operative_system, :processor, :memory, :mac, :created_at, :updated_at
json.url device_url(device, format: :json)
