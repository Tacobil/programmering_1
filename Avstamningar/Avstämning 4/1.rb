
# >=25 hot
# 18-24 warm
# 11-17 mild
# 1-10 cold
# <=0 freezing

def temperature_description(temperature)
    
    if temperature >= 25
        temp_string = "hot"
    elsif temperature >= 18
        temp_string = "warm"
    elsif temperature >= 11
        temp_string = "mild"
    elsif temperature >= 1
        temp_string = "cold"
    else
        temp_string = "freezing"
    end
end

p temperature_description(0) # freezing
p temperature_description(1) # cold
p temperature_description(10) # cold
p temperature_description(11) # mild
p temperature_description(17) # mild
p temperature_description(18) # warm
p temperature_description(24) # warm
p temperature_description(25) # hot
