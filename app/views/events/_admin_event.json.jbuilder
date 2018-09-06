json.extract! admin_event, :id, :title, :startdate, :enddate, :description, :drive_link, :state, :created_at, :updated_at
json.url admin_event_url(admin_event, format: :json)
