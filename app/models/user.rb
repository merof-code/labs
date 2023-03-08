class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable
  belongs_to :role
  belongs_to :department

  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  def name
    'sdf' # TODO: add name def
  end
end
