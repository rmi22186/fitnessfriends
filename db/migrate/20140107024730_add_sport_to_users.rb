class AddSportToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sport, :string
  end
end
