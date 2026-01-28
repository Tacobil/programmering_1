def average_temperature(readings_path)
    results = []

    Dir.chdir(readings_path)
    temp_folders = Dir.glob("*.temps")

    i = 0
    while i < temp_folders.length
        temps = File.readlines(temp_folders[i])
        j = 0
        while j < temps.length
            results << temps[j].to_f

            j += 1
        end

        result /= temps.length

        i += 1
    end

    return result
end

p average_temperature("readings/april")