class Clinical < ApplicationRecord
  belongs_to :institution
  has_one :rate
  has_many :videos
end
