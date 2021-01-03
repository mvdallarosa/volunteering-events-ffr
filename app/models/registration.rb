class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :user, presence: true
  validates :event, presence: true
  validates :note, length: { maximum: 1000,
    too_long: "Massimo %{count} caratteri" }
end
