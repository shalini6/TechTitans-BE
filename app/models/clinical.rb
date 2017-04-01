class Clinical < ApplicationRecord
  belongs_to :institution
  has_many :videos
end
