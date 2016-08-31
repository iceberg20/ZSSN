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

  # PATCH/PUT /survivors/1
	def report_infection
		survivor = Survivor.find(params[:id])
		puts survivor
		puts survivor.infected_reports
		survivor.infected_reports+=1
		survivor.save
		if survivor.infected_reports >= 3
		  render json: { message: "Survivor infected!" }
		else
		  render json: { message: "Survivor is not infected!" }
		end
	end

end
