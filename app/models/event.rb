class Event < ApplicationRecord
  belongs_to :project
  has_many :registrations, dependent: :destroy
  has_one_attached :photo
end
