class TagBook < ApplicationRecord
  belongs_to :tag
  belongs_to :book
end
