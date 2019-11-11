class EventItem < ApplicationRecord
  enum status: %i[Aberto Fechado]
  belongs_to :event
  belongs_to :item
  validates_uniqueness_of :item
end
