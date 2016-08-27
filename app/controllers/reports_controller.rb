class ReportsController < ApplicationController
	def infected
		survivors = Survivor.all
		all = Survivor.count
		puts "total #{all}"
		qtd_infect = 0
		survivors.each do |s|
				if s.infected_reports == 3 
					qtd_infect+= 1
				end 
				puts "infected #{qtd_infect}"
		end
		percent = ( qtd_infect.to_f/all.to_f ) * 100 

		render json: { "infected_survivors":"#{percent}"+"%" }
	end

	def non_infected
		survivors = Survivor.all
		all = Survivor.count
		puts "total #{all}"
		qtd_non_infect = 0
		survivors.each do |s|
				if s.infected_reports < 3 
					qtd_non_infect+= 1
				end 
				puts "non_infected #{qtd_non_infect}"
		end

		percent = ( qtd_non_infect.to_f/all.to_f ) * 100 

		render json: { "non_infected_survivors":"#{percent}"+"%" }		
	end
end
