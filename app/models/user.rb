class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :items

  validates :username, presence: true, uniqueness: true, length: {minimum: 3 }
  validates :name, presence: true

  acts_as_followable
  acts_as_follower
end
