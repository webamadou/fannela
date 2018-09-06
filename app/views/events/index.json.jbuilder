json.array! @events, partial: 'admin_events/admin_event', as: :event

json.set! :data do
  json.array! @events do |category|
    json.partial! 'admin_events/admin_event', category: category
    json.url  "
              #{link_to 'Show', category }
              #{link_to 'Edit', edit_category_path(category)}
              #{link_to 'Destroy', category, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end