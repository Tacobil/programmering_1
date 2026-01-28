def bsearch(values, n)
    guess = values.length / 2

    if values.length == 1
        return values[0] == n
    end

    if values[guess] > n # guess is too big, bsearch smaller values
        return bsearch(values[0..guess-1], n)
    elsif values[guess] < n # guess is to small, bsearch larger values
        return bsearch(values[guess+1..values.length-1], n)
    else
        return true
    end
end


p bsearch([1,2,3,4,5,6,7,8,9,10], 10)
