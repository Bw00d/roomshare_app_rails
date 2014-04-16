class User < ActiveRecord::Base
  has_and_belongs_to_many :accomodations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         after_create :send_welcome_message

  def send_welcome_message
    UserMailer.welcome_message(self).deliver
  end
end
