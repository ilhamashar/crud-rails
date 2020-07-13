class BelajarMigration < ActiveRecord::Migration[6.0]
  def up
    create_table :books do |t|
      t.string :title, default: 'belum ada judul', limit: 100
      t.float :price, null: false
      t.integer :page, default: 0
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
