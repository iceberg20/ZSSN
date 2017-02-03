class Survivor < ApplicationRecord
	has_one :inventory
	ActionController::Parameters.permit_all_parameters = true

	def infected?
		if self.infected_reports >= 3
			true
		else
			false
		end
	end
end
