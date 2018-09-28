json.set! :data do
  json.array! @coverages do |coverage|
    json.partial! 'coverages/coverage', coverage: coverage
    json.url  "
              #{link_to 'Show', coverage }
              #{link_to 'Edit', edit_coverage_path(coverage)}
              #{link_to 'Destroy', coverage, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end