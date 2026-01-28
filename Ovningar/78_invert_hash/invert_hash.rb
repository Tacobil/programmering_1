def invert_hash(hash)
    inverted_hash = {}
    hash.each do |key, value|
        inverted_hash[value] = key
    end
    return inverted_hash
end