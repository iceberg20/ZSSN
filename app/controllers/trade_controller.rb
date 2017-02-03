class TradeController < ApplicationController

	def test
		render plain: "OK!"	
	end
	
	# POST /trade                            

	def trade
  	if valid_trade?(params)
  		@survivor_id_1 = params["survivor_1"]["id"].to_i
  		@survivor_id_2 = params["survivor_2"]["id"].to_i

  		@items_1 = params["survivor_1"]["items"].to_unsafe_hash
  		@items_2 = params["survivor_2"]["items"].to_unsafe_hash

  		swap_items(@survivor_id_1, @survivor_id_2, @items_1, @items_2)
  		
  		render json: "trade made successfully!"   		
  	else
   		render json: "invalid_trade"
  	end
	end

 private
 		def swap_items(id_1, id_2, items_1, items_2)
 			@survivor_1 = Survivor.find(id_1)
 			@survivor_2 = Survivor.find(id_2)

 			Survivor.transaction do
 				begin
		 			# Surviver_1 receiving items
					@survivor_1.inventory.water = @survivor_1.inventory.water + items_2["water"].to_i
					@survivor_1.inventory.food = @survivor_1.inventory.food + items_2["food"].to_i
					@survivor_1.inventory.medication = @survivor_1.inventory.medication + items_2["medication"].to_i
					@survivor_1.inventory.ammunition = @survivor_1.inventory.ammunition + items_2["ammunition"].to_i

					# Surviver_1 giving items
					@survivor_1.inventory.water = @survivor_1.inventory.water - items_1["water"].to_i
					@survivor_1.inventory.food = @survivor_1.inventory.food - items_1["food"].to_i
					@survivor_1.inventory.medication = @survivor_1.inventory.medication - items_1["medication"].to_i
					@survivor_1.inventory.ammunition = @survivor_1.inventory.ammunition - items_1["ammunition"].to_i
		 			
		 			# Surviver_2 receiving items
					@survivor_2.inventory.water = @survivor_2.inventory.water + items_2["water"].to_i
					@survivor_2.inventory.food =  @survivor_2.inventory.food + items_2["food"].to_i
					@survivor_2.inventory.medication = @survivor_2.inventory.medication + items_2["medication"].to_i
					@survivor_2.inventory.ammunition = @survivor_2.inventory.ammunition + items_2["ammunition"].to_i

					# Surviver_2 giving items
					@survivor_2.inventory.water = @survivor_2.inventory.water - items_2["water"].to_i
					@survivor_2.inventory.food = @survivor_2.inventory.food - items_2["food"].to_i
					@survivor_2.inventory.medication = @survivor_2.inventory.medication - items_2["medication"].to_i
					@survivor_2.inventory.ammunition = @survivor_2.inventory.ammunition - items_2["ammunition"].to_i

		 			@survivor_1.inventory.save
		 			@survivor_2.inventory.save
 				end
 			end

 		end
		
		def valid_trade?(params)
  		survivor_1 = Survivor.find(params["survivor_1"]["id"].to_i)
  		survivor_2 = Survivor.find(params["survivor_2"]["id"].to_i)

  		unless survivor_1.infected? or survivor_2.infected?  			
						sum1 = 0
						params.to_unsafe_hash["survivor_1"]["items"].each { |name, qtd|
							sum1 += value(name) * qtd.to_i

						}

						sum2 = 0
						params.to_unsafe_hash["survivor_2"]["items"].each { |name, qtd|
							sum2 += value(name) * qtd.to_i
						}

						if sum1 == sum2
							true
						else
							false
						end	
			else
				false
			end
		end

		def value(item_name)
			out =2
			if item_name == 'water'
				out = 4
			elsif item_name == 'food'
				out = 3
			elsif item_name == 'medication'
				out = 2
			elsif item_name == 'ammunition'
				out = 1
			else
				out = -1			
			end
			out 
		end
end
