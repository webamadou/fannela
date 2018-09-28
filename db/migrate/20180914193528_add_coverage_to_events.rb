class AddCoverageToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :coverage, foreign_key: true
  end
end
