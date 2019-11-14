class Item < ApplicationRecord
  belongs_to :user


   def value=(value)
    if value.is_a?(String)
      value.gsub!(/[^0-9]/, '').insert(-3, '.').to_f
    end
    self[:value] = value
  end

  def to_s
    description.uppercase
  end
end
