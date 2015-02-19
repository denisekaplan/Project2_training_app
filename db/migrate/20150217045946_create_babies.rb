class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.integer :parent_id
      

      t.timestamps null: false
    end
  end
end
