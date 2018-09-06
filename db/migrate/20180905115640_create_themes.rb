class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name
      t.integer :state, default: 0
      t.references :category

      t.timestamps
    end
  end
end
