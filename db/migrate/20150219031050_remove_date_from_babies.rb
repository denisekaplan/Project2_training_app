class RemoveDateFromBabies < ActiveRecord::Migration
  def change
    remove_column :babies, :date, :date
  end
end
