# Haskell-Calculator
A web calculator with Haskell backend


## how to initialize the calculator?

You nedd to install the followoing package for to initialize the aplication.
https://www.haskell.org/ghcup/

To launch type the following into the terminal:

```
> cd haskellcalculator
> stack build
> stack exec haskellcalculator
```
the web application will be initialize on ```localhost:3000```, and will default you to the / route.

## how to use the Calculator
### Operations 
The API allows for 4 operations to be carried out: Addition, Subtraction, Mulitplication and Division.
They are all used by providing the name of the operator, followed by two integer operands.
```
/add/Int/Int 
```
So to Add two numbers 5 and 10, you would go to
```
/add/5/10
```
and this will return `15`
You can use the same idea with subtract, multiply and divide:
```
/subtract/Int/Int
/multiply/Int/Int
/divide/Int/Int
```
Every time you carry out an operation, it gets saved to a database. To see your calculations for a specific operator, don't put the two integers after the operator, eg `/add`, this will display a table of all the additions that have been carried out.
```
/add
/subtract
/multiply
/divide
```
Incidentally, if you wish to view every calculation for all the operators, you can, simply go to `/calculations` and it will display all the calculations, neat!

### HTML & JSON?
The API allows requests for both HTML and JSON, by default it will return HTML. In order to receive JSON instead add `?_accept=application/json` to the URL. 
For instance if you wish to have your addition in JSON, you would go to:
```
/add/5/10?_accept=application/json
```
And voila, JSON is returned!
This works for every calculation, as well as the list of operations that can be returned from `/calculations` or `/add` etc, and it will return a list of perfect JSON objects.

