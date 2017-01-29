class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :description
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :messages
  end
end
