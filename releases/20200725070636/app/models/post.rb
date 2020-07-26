class Post < ApplicationRecord
  belongs_to :patient
  belongs_to :bothering_start
  belongs_to :bothering_genre
end
