class User < ActiveRecord::Base

  has_many :followers, :class_name => 'Follower', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Follower', :foreign_key => 'follower_id'
  has_many :posts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  validates_presence_of :handle
  validates_uniqueness_of :handle, case_sensitive: false

  after_create :welcome_mailer

private
  def welcome_mailer
    UserMailer.signup_confirmation(self).deliver
  end
end
