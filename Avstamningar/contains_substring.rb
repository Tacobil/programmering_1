def contains_substring(string, sub_string)
    i = 0
    while i < string.length - (sub_string.length-1)
        s = string[i..i+sub_string.length-1]
        
        p s

        if sub_string == s
            return true
        end
        i += 1
    end

    return false
end

p contains_substring("hbooallo hallo", "boo")