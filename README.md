# PizzaBot
This is a bot encouraged to deliver pizzas in a given coordinates from a neighborhood, each house's address is represented by a coordinate X, Y, in more specific terms, given a grid (where each point
on the grid is one house) and a list of points representing houses in need of pizza delivery, return a list of
instructions for getting Pizzabot to those locations and delivering. An instruction is one of:

N: Move north
S: Move south
E: Move east
W: Move west
D: Drop pizza

Pizzabot always starts at the origin point, (0, 0). As with a Cartesian plane, this point lies at the most south-
westerly point of the grid.

Therefore, given the following input string:
5x5 (1, 3) (4, 4)

one correct solution would be:
ENNNDEEEND

#INSTRUCTIONS TO RUN THIS PROJECT

* clone this repository `git clone git@github.com:Rolvar/PizzaBot.git` or download and unzip the code
* open the project using XCode 12.5
* hit run or `cmd + r`
* add the entries you want to test in output window

You can also take a look to the test folder and run the test switching to PizzaBotChallengeTest target and hiting `cmd+u`
