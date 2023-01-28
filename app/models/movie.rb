class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, :overview, uniqueness: true, presence: true
end
