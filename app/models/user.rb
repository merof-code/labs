class User < ApplicationRecord
  include Randomizable
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable
  belongs_to :role
  belongs_to :department

  has_one_attached :avatar, dependent: :destroy

  before_create :set_defaults
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :start_date, presence: true
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true

  def name
    "#{last_name} #{first_name} #{middle_name}".squeeze
  end

  def set_defaults
    self.password ||= random_password
  end

  def random_password(length = 10)
    User.random_password(length)
  end

  def avatar_path
    avatar.attached? ? avatar : 'default_avatar.jpg'
  end

  def self.random_password(length = 10)
    o = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
    (0...length).map { o[rand(o.length)] }.join
  end
end
