PRNG = Random.new

def is_sorted(array)
    
    i = 1
    while i < array.length
        if array[i-1] > array[i]
            return false
        end

        i += 1
    end
    return true
end

def shuffle(array)
    shuffled_array = []

    i = array.length - 1

    while i >= 0
        selected = PRNG.rand(0..i)
        p selected
        shuffled_array << array[selected]

        array.delete_at(selected)

        i -= 1
    end

    array = shuffled_array
end


def bogosort(array)
    i = 0
    while is_sorted(array) == false
        shuffle(array)
        i += 1
    end
    p "#{i} attempts"
    return array
end
