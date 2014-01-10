class AddExperienceToUserSports < ActiveRecord::Migration
  def change
    add_column :user_sports, :experience, :string
    remove_column :sports, :experience, :string
  end
end
