def split_char(string, char)
    new_array = []
    sub_string = ""

    i = 0
    while i < string.length do
        if char == string[i]
            if sub_string != ""
                new_array << sub_string
                sub_string = ""
            end
        else
            sub_string += string[i]
        end
        i += 1
    end

    if sub_string != ""
        new_array << sub_string
    end

    return new_array
end

p split_char("hej hej hallå  h", " ")