class AddCategoryEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :categories, foreign_key: true
  end
end
