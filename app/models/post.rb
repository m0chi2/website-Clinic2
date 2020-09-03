class Post < ApplicationRecord
  belongs_to :patient
  belongs_to :bothering_start
  belongs_to :bothering_genre

  validates :bothering_start, presence:true
  validates :bothering_genre, presence:true
  validates :content, presence:true,
  					  length: {maximum: 500}
end
