class Project < ApplicationRecord
  has_many :events, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 3000,
    too_long: "Massimo %{count} caratteri" }
  validates :photo, presence: true
end
