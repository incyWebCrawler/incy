class Link < ApplicationRecord
  validates :url, uniqueness: true
end
