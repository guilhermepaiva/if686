data Temperature = Celsius Float | Fahrenheit Float | Kelvin Float

isCelsius :: Temperature -> Bool
isCelsius (Celsius _) = True 
isCelsius (Fahrenheit _) = False
isCelsius (Kelvin _) = False

convertToCelsius :: Temperature -> Float
convertToCelsius (Fahrenheit n) = ((n-31)/1.8)
convertToCelsius (Kelvin n) = 273.15+n



