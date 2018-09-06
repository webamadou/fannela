class CreateAdminCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code_iso
      t.integer :state

      t.timestamps
    end
  end
end
