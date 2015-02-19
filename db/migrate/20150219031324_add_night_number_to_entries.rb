class AddNightNumberToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :night_number, :integer
  end
end
