def add(sum, n, stop)
    sum += n
    
    if n < stop
        add(sum, n+1, stop)
    else
        return sum
    end
end

def sum_from_to(start, stop)
    sum = add(0, start, stop)
    return sum
end

p sum_from_to(1, 10)
p sum_from_to(5, 10)
p sum_from_to(10, 10)
p sum_from_to(10, 5)
p sum_from_to(20, 25)