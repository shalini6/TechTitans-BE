class Clinical < ApplicationRecord
  belongs_to :institution
  has_one :rate
end
