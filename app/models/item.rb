class Item < ApplicationRecord
  belongs_to :user
  validates_presence_of :quantities
end
