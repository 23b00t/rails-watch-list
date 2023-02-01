class List < ApplicationRecord
  has_one_attached :photo

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  def ave_rating
    ave = reviews.map(&:rating).sum.fdiv(reviews.length)
    (ave * 2).round / 2.0 unless ave.nan?
  end
end
