json.set! :data do
  json.array! @salaries do |salary|
    json.partial! 'salaries/salary', salary: salary
    json.url  "
              #{link_to 'Show', salary }
              #{link_to 'Edit', edit_salary_path(salary)}
              #{link_to 'Destroy', salary, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end