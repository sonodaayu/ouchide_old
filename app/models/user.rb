class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ideas,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes,source: :idea

  validates :name, presence: true 
  validates :profile, length: { maximum: 200 }
end
