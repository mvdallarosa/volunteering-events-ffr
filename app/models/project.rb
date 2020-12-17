class Project < ApplicationRecord
  has_many :events, dependent: :destroy
  has_one_attached :photo
end
