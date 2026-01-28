def merge_hashes(hash1, hash2)
    new_hash = {}

    hash1.each do |key, value|
        new_hash[key] = value
    end

    hash2.each do |key, value|
        new_hash[key] = value
    end
    return new_hash
end