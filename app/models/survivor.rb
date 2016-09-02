class Survivor < ApplicationRecord
	has_one :inventory
	ActionController::Parameters.permit_all_parameters = true
end
