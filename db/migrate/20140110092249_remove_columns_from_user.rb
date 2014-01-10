class RemoveColumnsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :sport, :string
    remove_column :users, :experience, :string
  end
end
