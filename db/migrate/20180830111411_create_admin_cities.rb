class CreateAdminCities < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_cities do |t|
      t.string :name
      t.references :country, foreign_key: true
      t.integer :state

      t.timestamps
    end
  end
end
