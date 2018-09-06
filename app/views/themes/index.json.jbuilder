json.set! :data do
  json.array! @themes do |theme|
    json.partial! 'themes/theme', theme: theme
    json.url  "
              #{link_to 'Show', theme }
              #{link_to 'Edit', edit_theme_path(theme)}
              #{link_to 'Destroy', theme, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end