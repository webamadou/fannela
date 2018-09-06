class AddSocialsIdUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook_id, :string, default: nil
    add_column :users, :google_id, :string, default: nil
  end
end
