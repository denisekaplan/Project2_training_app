class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :date
      t.time :bedtime
      t.time :awake
      t.time :asleep
      t.time :wake_up
      t.integer :baby_id

      t.timestamps null: false
    end
  end
end
