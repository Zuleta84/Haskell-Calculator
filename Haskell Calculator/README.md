# Haskell-Calculator
A web calculator using RESTful API principles in a Haskell environment

## Initialising the calculator

In order to setup this application you must have stack, yesod and cabal installed on your machine.

To launch type the following into the terminal:

```
> cd haskellcalculator
> stack build
> stack exec haskellcalculator
```
This will intialise the web application on ```localhost:3000```, and will default you to the / route.

## Using the Calculator
### Operations
The API allows for 4 operations to be carried out: Addition, Subtraction, Mulitplication and Division.
They are all used by providing the name of the operator.

### HTML & JSON
The API allows requests for both HTML and JSON, by default it will return HTML. In order to receive JSON instead add `?_accept=application/json` to the URL. 
For instance if you wish to have your addition in JSON, you would go to:
