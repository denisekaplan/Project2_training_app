class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.date :photo_date
      t.references :parent, index: true

      t.timestamps null: false
    end
    add_foreign_key :photos, :parents
  end
end
