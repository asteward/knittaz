class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  validates_presence_of :handle
  after_create :welcome_mailer

private
  def welcome_mailer
    UserMailer.signup_confirmation(self).deliver
  end
end
