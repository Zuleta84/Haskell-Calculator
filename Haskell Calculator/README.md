# Haskell-Calculator
A Calculator with a backend using haskell. You need to install https://www.haskell.org/ghcup/ 

in the terminal write:
```
> cd haskellcalculator
> stack build
> stack exec haskellcalculator
```
This will intialise the web application on ```localhost:8080```, and will default you to the / route.

## Using the Calculator
### Operations
The API allows for 4 operations to be carried out: Addition, Subtraction, Mulitplication and Division.
They are all used by providing the name of the operator.

### HTML & JSON
The API allows requests for both HTML and JSON, by default it will return HTML. In order to receive JSON instead add `?_accept=application/json` to the URL. 

