

def ordanalys()
	puts "Vilken fil vill du analysera?"
	path = ""

	loop do
		path = gets.chomp

		break if File.file?(path)
		puts "Ange en lämplig fil!"
	end
	
	puts "Läser in #{path}..."
	string = File.read(path)

	# Format
	string = string.downcase # make lowercase
	words = string.split(" ") # split

	words.each_with_index do |word, i|
		words[i] = clean_word(word)
	end


	puts "Hittade #{words.length} ord."

	input = ""
	while input != "quit"
		puts ""
		puts "Välj Statistik:"
		puts "'count' - Totalt antal ord"
		puts "'unique' - Antal unika ord"
		puts "'frequent' - Vanligaste ordet"
		puts "'average' - Genomsnittliga ordlängd"
		puts "'longest' - Längsta ordet"
		puts "'quit' - Avsluta"

		input = gets.chomp

		case input
		when "count"
			puts "Antal ord: #{words.length}"
		when "unique"
			unique_words = words.uniq
			puts "Antal unika ord: #{unique_words.length}"
		when "frequent"
			word_count = {}
			
			# create hash and find largest
			most_frequent_word = nil
			words.each do |word|
				if word_count[word] == nil
					word_count[word] = 1
				else
					word_count[word] += 1
				end
				
				if most_frequent_word == nil || words[most_frequent_word] < word_count[word]
					most_frequent_word = word
				end
			end
			puts "The most frequent word is #{most_frequent_word}, appears #{words[most_frequent_word]} times."

		when "average"

		when "longest"

		end
	end
	
end

def clean_word(string)
	special_characters = [".", ",", "!", "?", '"', "'", ":", ";", "-", "(", ")"]
	result = ""

	string.each_char do |char|
		if special_characters.include?(char) == false
			result += char
		end
	end

	return result
end

ordanalys()
