class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  def select_img
    if bookmarks.first.nil?
      ActionController::Base.helpers.asset_path('cinema.jpg')
    else
      bookmarks.first.movie.poster_url
    end
  end
end
