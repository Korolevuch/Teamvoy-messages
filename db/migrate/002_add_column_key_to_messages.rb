class AddColumnKeyToMessages < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
      t.string :key
    end
  end

  def self.down
    change_table :messages do |t|
      t.remove :key
    end
  end
end
