def get_items(path)
	items = []
	File.readlines(path).each do |item|
		name, amount, price = item.split(",")
		items << {"namn" => name, "antal" => amount.to_i, "pris" => price.to_f}
	end
	return items
end

def inventarie(path)
	puts "Välkommen till Inventarie"

	input = ""
	while input != "quit"
		puts ""
		puts "Välj ett kommando:"
		puts "'add' - Lägg till en vara"
		puts "'list' - Lista alla varor"
		puts "'search' - Sök efter en vara"
		puts "'delete' - To bort en vara"
		puts "'quit' - Avsluta"

		input = gets.chomp 
		puts ""
		
		case input
		when "add"
			puts "Ange varans namn:"
			name = gets.chomp
			amount, price = ""

			loop do
				puts "Ange antal:"
				amount = gets.chomp.to_i
				break if amount > 0
				puts "Ange ett antal större än noll!"
			end

			loop do
				puts "Ange styckpris:"
				price = gets.chomp.to_f
				break if price >= 0
				puts "Ange ett pris över 0!"
			end

			# write
			fil = File.open(path, "a") 
			fil.puts "#{name},#{amount},#{price}" 
			fil.close 

			puts "#{name} har lagts till"
		when "list"
			sum = 0
			get_items(path).each_with_index do |item, i|
				sum += item["pris"] * item["antal"]
				puts "#{i+1}. #{item["namn"]} - Antal: #{item["antal"]}, Pris: #{item["pris"]} kr"
			end
			puts "Totalt lagervärde: #{sum} kr"
		when "search"
			puts "Ange varans namn:"
			name = gets.chomp
			result = nil
			get_items(path).each do |item|
				if item["name"] == name
					result = item
					break
				end
			end

			if result
				puts "#{result["namn"]} - Antal: #{result["antal"]}, Pris: #{result["pris"]} kr"
			else
				puts "varan '#{name}' hittades inte."
			end


		when "delete"
			puts "Ange varans namn:"
			name = gets.chomp
			success = false
			
			get_items(path).each_with_index do |item, i|
				if item["namn"] == name
					# delete at specific line
					lines = File.readlines(path)
					lines.delete_at(i)  # removes line at index 2 (3rd line)

					File.write("file.txt", lines.join)
					
					puts "Tog bort varan #{name}"

					success = true
					break
				end
			end
			
			if success == false
				puts "varan '#{name}' hittades inte."
			end

		end
	end
end


inventarie("inventory.csv")
