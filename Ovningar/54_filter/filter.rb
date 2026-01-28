def filter(array, value)
    filtered_array = []

    array.each do |element|
        if element == value
            filtered_array << element
        end
    end

    return filtered_array
end