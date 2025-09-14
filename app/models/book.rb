class Book < ApplicationRecord
  # need to add title & body
  validates :title, presence: true
  validates :body, presence: true
end
