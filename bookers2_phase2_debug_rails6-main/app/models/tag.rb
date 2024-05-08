class Tag < ApplicationRecord
  has_many :tag_books, dependent: :destroy
end
