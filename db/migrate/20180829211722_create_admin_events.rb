class CreateAdminEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :startdate
      t.datetime :enddate
      t.text :description
      t.text :drive_link
      t.integer :state

      t.timestamps
    end
  end
end
