class ReportsController < ApplicationController
	def infected
		survivors = Survivor.all
		all = Survivor.count
		qtd_infect = 0
		survivors.each do |s|
				if s.infected_reports == 3 
					qtd_infect+= 1
				end 
		end
		percent = ( qtd_infect.to_f/all.to_f ) * 100 

		render json: { "infected_survivors":"#{percent}"+"%" }
	end
end
