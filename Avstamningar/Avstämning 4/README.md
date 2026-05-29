# Avstämning 4 - Kod på dator 1 

**Du måste själv testköra din kod med olika input och verifiera att den fungerar.**

Lämna kvar testkörningarna i filen så vi ser *att* och *hur* du testat din kod. 

**OBS**: *Du måste även köra de automatiska testerna (de verifierar att lärarnas "hemliga" tester kommer kunna köras)*

För att köra testerna kör `rake test 1` där du byter ut 1 mot numret på uppgiften du vill testa.

### Upplägg och arbetssätt (utöver det som presenterades på projektorn)

Det är inte förväntat att alla elever klarar alla uppgifter. Lös och lämna in de uppgifter du lyckas lösa, och lämna in eventuell *ofärdig* kod du har, även om du inte blivit klar med en uppgift. Efter avstämningen kommer vi ha en genomgång med lösningsförslag, och du kommer få göra en självbedömning.

Det är OK att ställa frågor (till läraren) under avstämningen. Fråga hellre en gång för mycket än en gång för lite.

## Uppgift 1: Temperature Description

Fil: **1.rb**

Skapa funktionen `temperature_description` som tar ett **heltal** som representerar en temperatur i Celsius som input.

Funktionen ska sen **returnera** en **sträng** som beskriver hur temperaturen känns, baserat på graderna, enligt listan nedan:

Varmt (18-24 grader): "warm"
Hett (25 grader eller mer): "hot"
Kallt (1-10 grader): "cold"
Milt (11-17 grader): "mild"
Iskallt (0 grader eller kallare): "freezing"

##### Exempelanrop:

````ruby
temperature_description(20)  #=> "warm"
temperature_description(30)  #=> "hot"
temperature_description(5)   #=> "cold"
temperature_description(15)  #=> "mild"
temperature_description(-10) #=> "freezing"
````


## Uppgift 2: Count ending with

Fil: **2.rb**

Skapa funktionen `count_ending_with` som tar en **array av strängar**, och ett **tecken** (en sträng med bara ett tecken) som input.

Funktionen ska sen **returnera** *antalet* strängar som slutar på det givna tecknet.

Om ingen sträng slutar på det givna tecknet ska 0 returneras.

Lös uppgiften utan att använda de inbyggda metoderna `count`, `select`, `reduce` (eller liknande).

##### Exempelanrop:

````ruby
files = ["image.png", "document.pdf", "photo.png", "notes.txt", "icon.png"]
count_ending_with(files, "g") #=> 3
count_ending_with(files, "f") #=> 1
count_ending_with(files, "t") #=> 1
count_ending_with(files, "x") #=> 0
````

## Uppgift 3: Is Sorted Descending

Fil **3.rb**

Skapa funktionen `is_sorted_descending` som tar en **array av heltal** som input. Funktionen ska sen avgöra om arrayen är **sorterad i *fallande* ordning** (från störst till minst) eller ej.

Om arrayen är sorterad i fallande ordning ska funktionen **returnera** **true** , annars **false**

Lös uppgiften *utan att använda de inbyggda sorterings-metoderna*

##### Exempelanrop:

````ruby
is_sorted_descending([9,7,5,3])    #=> true
is_sorted_descending([100,50,25])  #=> true
is_sorted_descending([5,5,5,5])    #=> true
is_sorted_descending([8,6,6,4])    #=> true
is_sorted_descending([3,5,2,1])    #=> false
is_sorted_descending([42])         #=> true
is_sorted_descending([])           #=> true
````

## Uppgift 4: Filter below threshold

Fil: **4.rb**

`filter_below_threshold` tar en `Hash` och ett tröskelvärde (en `Integer`) som input och returnerar en ny `Hash` med endast de nyckel-värde-par där *värdet* är **mindre** än tröskelvärdet.

##### Exempelanrop:
```ruby
temperatures = {"Stockholm" => 5, "Göteborg" => 8, "Malmö" => 12}
filter_below_threshold(temperatures, 10) #=> {"Stockholm" => 5, "Göteborg" => 8}

stock = {"apples" => 50, "bananas" => 3, "oranges" => 12}
filter_below_threshold(stock, 15) #=> {"bananas" => 3, "oranges" => 12}

points = {"x" => 100, "y" => 200, "z" => 300}
filter_below_threshold(points, 50) #=> {}

empty_hash = {}
filter_below_threshold(empty_hash, 10) #=> {}
```
