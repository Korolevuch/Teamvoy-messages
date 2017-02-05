class AddCountVisitToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :count_visit, :integer, default: 0
  end
end
