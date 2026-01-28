def contains(array, value)
    i = 0
    while i < array.length
        if array[i] == value
            return true
        end
        i += 1
    end

    return false
end

def unique(array)
    unique_array = []

    i = 0
    while i < array.length
        value = array[i]
        if contains(unique_array, value) == false
            unique_array.push(value)
        end
        i += 1
    end
    return unique_array
end