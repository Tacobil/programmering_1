HASH = {
    1000 => "M", 
    900 => "CM", 
    500 => "D", 
    400 => "CD", 
    100 => "C", 
    90 => "XC", 
    50 => "L", 
    40 => "XL", 
    10 => "X", 
    9 => "IX", 
    5 => "V", 
    4 => "IV", 
    1 => "I"
}

def arabic_to_roman(num)
    roman = ""

    i = 0
    while i < HASH.length
        arabic_num = HASH.keys[i]

        if arabic_num <= num
            roman += HASH[arabic_num]
            num -= arabic_num
        else
            i += 1
        end
    end

    return roman
end