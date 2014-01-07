class User < ActiveRecord::Base

  attr_accessor :current_password

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  mount_uploader :avatar, AvatarUploader

  validates :description, length: { maximum: 144 }

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      pass = Devise.friendly_token[0,20]
      user = User.new(   first_name: auth.extra.raw_info.first_name,
                         last_name: auth.extra.raw_info.last_name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         password: pass,
                         password_confirmation: pass
                        )
      user.skip_confirmation!
      user.save
    else
      user.update_attribute(:facebook_photo, "http://graph.facebook.com/#{auth.info.nickname}/picture?type=large")
    end
    user
  end

  LEVELS = ['rookie', 'seasoned', 'veteran']
  SPORTS = ['rock climber', 'runner', 'basketball player']


  geocoded_by :zipcode
  after_validation :geocode, :if => :zipcode_changed?

  #field :coordinates, :type => Array
  #field :zipcode

end