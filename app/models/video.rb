class Video < ApplicationRecord
  belongs_to :clinical
  belongs_to :patient
end
