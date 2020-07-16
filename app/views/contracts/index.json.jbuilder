json.set! :data do
  json.array! @contracts do |contract|
    json.partial! 'contracts/contract', contract: contract
    json.url  "
              #{link_to 'Show', contract }
              #{link_to 'Edit', edit_contract_path(contract)}
              #{link_to 'Destroy', contract, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end