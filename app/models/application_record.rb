class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :message, length: { maximum: 140 }
  validates :message, presence: true
end
