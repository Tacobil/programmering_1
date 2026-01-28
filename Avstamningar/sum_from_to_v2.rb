def sum_from_to(start, stop, sum=0)
    min = [start, stop].min
    max = [start, stop].max

    sum += min

    if min < max
        sum_from_to(min+1, max, sum)
    else
        return sum
    end
end

p sum_from_to(1, 10)
p sum_from_to(5, 10)
p sum_from_to(10, 10)
p sum_from_to(10, 5)
p sum_from_to(20, 25)