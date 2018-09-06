class City < ApplicationRecord
  belongs_to :country, class_name: 'Admin::Country', foreign_key: 'country_id'
end
