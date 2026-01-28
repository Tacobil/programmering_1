def average(array)
    sum = 0
    array.each { |num| sum += num}

    return sum.to_f / array.length
end