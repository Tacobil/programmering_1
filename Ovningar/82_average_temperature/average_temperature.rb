def average_temperature(readings_path)
    if File.exist?(readings_path) == false
        return "Mappen finns inte."
    end

    temperatures = []

    Dir.chdir(readings_path)
    temp_file = Dir.glob("*.temps")

    temp_file.each do |file|
        temps = File.readlines(file)

        temps.each do |temp|
            temperatures << temp.to_f
        end
    end

    if temperatures.length == 0
        return "Inga mätfiler hittades."
    end

    return average(temperatures)
end

def average(array)
    return array.sum / array.length
end

# p average_temperature("nope/nuh-uh") #=> "Mappen finns inte."
p average_temperature("readings/may") #=> "Inga mätfiler hittades."