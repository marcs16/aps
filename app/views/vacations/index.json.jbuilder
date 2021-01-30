json.set! :data do
  json.array! @vacations do |vacation|
    json.partial! 'vacations/vacation', vacation: vacation
    json.url  "
              #{link_to 'Show', vacation }
              #{link_to 'Edit', edit_vacation_path(vacation)}
              #{link_to 'Destroy', vacation, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end