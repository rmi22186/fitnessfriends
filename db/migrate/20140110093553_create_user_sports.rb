class CreateUserSports < ActiveRecord::Migration
  def change
    create_table :user_sports do |t|
      t.references :user
      t.references :sports

      t.timestamps
    end
  end
end
