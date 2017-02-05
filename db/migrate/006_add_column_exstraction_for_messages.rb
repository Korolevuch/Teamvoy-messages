class AddColumnExstractionForMessages < ActiveRecord::Migration
  def change
    add_column :messages, :exstraction, :integer, default: 0
  end
end
