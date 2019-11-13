class Item < ApplicationRecord
  belongs_to :user

  def to_s
    description.uppercase
  end
end
