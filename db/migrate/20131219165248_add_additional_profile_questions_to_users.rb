class AddAdditionalProfileQuestionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fun_fact, :string
    add_column :users, :fitness_goal, :string
  end
end
