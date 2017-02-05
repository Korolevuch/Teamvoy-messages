class AddSluggedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :slug, :string, unique: true
  end
end
