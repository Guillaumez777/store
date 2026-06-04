class Todo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  scope :pending, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
  scope :recent, -> { order(created_at: :desc) }
end
