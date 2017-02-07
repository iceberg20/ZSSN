class ReportsController < ApplicationController
	def infected
		percent = ( infected_count/all_survivors ) * 100 

		render json: { "infected_survivors":"#{percent}"+"%" }
	end

	def non_infected
		percent = ( non_infected_count/all_survivors ) * 100 

		render json: { "non_infected_survivors":"#{percent}"+"%" }		
	end

	def infected_count
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

		qtd_infect.to_f
	end

	def non_infected_count
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

		qtd_non_infect.to_f
	end

	def all_survivors
		Survivor.count.to_f
	end

	def report_infection
		survivor = Survivor.find(params[:id])
		survivor.infected_reports+=1
		survivor.save
		if survivor.infected_reports >= 3
		  render json: { message: "Survivor infected!" }
		else
		  render json: { message: "Survivor is not infected!" }
		end
	end

	def avg_resourses
		water = 0
		food = 0
		medication = 0
		ammunition = 0

		Survivor.not_infected.each do |survivor|
			water+= survivor.inventory.water
			food+= survivor.inventory.food
			medication+= survivor.inventory.medication
			ammunition+= survivor.inventory.ammunition
		end


		qtd = Survivor.not_infected.count

		avg_water = water/qtd
		avg_food = food/qtd
		avg_medication = medication/qtd
		avg_ammunition = ammunition/qtd

		avg_report = {avg_water: avg_water, avg_food: avg_food, avg_medication: avg_medication, 
			avg_ammunition: avg_ammunition }

		render json: avg_report
	end

end
