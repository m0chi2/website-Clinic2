class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name_kana, presence: true,
            format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :reservations
end
