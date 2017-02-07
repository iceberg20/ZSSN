class Survivor < ApplicationRecord
	has_one :inventory
	ActionController::Parameters.permit_all_parameters = true

	validates :name, :age, :gender, :lat, :long, presence: true

	scope :infected, -> { where("infected_reports >= 3") }
	scope :not_infected, -> { where("infected_reports < 3") }

	def initializer
	end

	def infected?
		if self.infected_reports >= 3
			true
		else
			false
		end
	end
end
