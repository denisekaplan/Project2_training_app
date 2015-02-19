class AddNightNumberToBabies < ActiveRecord::Migration
  def change
    add_column :babies, :night_number, :integer
  end
end
