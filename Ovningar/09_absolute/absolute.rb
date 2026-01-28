def absolute(number)
    if number < 0
        abs_number = number * -1
    else
        abs_number = number
    end

    return abs_number
end

p absolute(-50)
