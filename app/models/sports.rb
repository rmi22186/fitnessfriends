class Sports < ActiveRecord::Base
  belongs_to :user_sports
  belongs_to :users, through: :user_sports
end
