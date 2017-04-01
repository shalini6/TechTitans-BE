class Rate < ApplicationRecord
	belongs_to: clinical
	belongs_to: institution
end
