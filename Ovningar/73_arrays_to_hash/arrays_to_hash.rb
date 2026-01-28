def arrays_to_hash(keys, values)
    hash = {}
    
    keys.each_with_index do |key, i|
        hash[key] = values[i]
    end

    return hash
end
