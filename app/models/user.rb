class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable
  belongs_to :role
  belongs_to :department

  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :start_date, presence: true
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true

  def name
    'sdf' # TODO: add name def
  end
end
