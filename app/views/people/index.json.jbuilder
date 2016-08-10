json.array!(@people) do |person|
  json.extract! person, :id, :academic_qualification, :academic_status, :affiliated_organization,
                        :first_name, :last_name, :middle_name, :pcard_id
end
