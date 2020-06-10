json.set! :data do
  json.array! @languages do |language|
    json.partial! 'languages/language', language: language
    json.url  "
              #{link_to 'Show', language }
              #{link_to 'Edit', edit_language_path(language)}
              #{link_to 'Destroy', language, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end