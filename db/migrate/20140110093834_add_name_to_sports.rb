class AddNameToSports < ActiveRecord::Migration
  def change
    add_column :sports, :name, :string
  end
end
