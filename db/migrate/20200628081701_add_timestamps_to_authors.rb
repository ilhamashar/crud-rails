class AddTimestampsToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :created_at, :datetime
    add_column :authors, :updated_at, :datetime
  end
end
