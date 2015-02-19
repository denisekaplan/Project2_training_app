class RemoveDateFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :date, :date
  end
end
