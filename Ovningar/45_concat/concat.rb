def concat(array, other_array)
    new_array = []

    array.each { |element| new_array << element }
    other_array.each { |element| new_array << element }

    return new_array
end