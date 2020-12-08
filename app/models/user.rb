class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_email

  has_many :fridges
  has_many :reviews
  has_many :saved_recipes, dependent: :destroy
  has_one_attached :photo

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
