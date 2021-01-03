class Event < ApplicationRecord
  belongs_to :project
  has_many :registrations, dependent: :destroy
  has_one_attached :photo
  validates :project, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :activity, presence: true, length: { maximum: 1000,
    too_long: "Massimo %{count} caratteri" }
end
