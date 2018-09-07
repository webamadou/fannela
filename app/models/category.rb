class Category < ApplicationRecord

  has_many :events, foreign_key: 'categories_id'
end
