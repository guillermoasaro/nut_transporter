# Nut Transporter
A Ruby on Rails project that calculates the maximum amount of nuts that can be transported to a town from a pile of nuts in an oasis across a desert, given the distance between the town and the pile, the amount of nuts in the pile, the amount of nuts consumed by the horse per kilometer traveled, and the capacity of the cart that carries the nuts.

## Installation
1. Clone the repository or download the source code.
2. Install Ruby on Rails and its dependencies.
3. Install the required gems by running `bundle install` in the terminal.
4. Run the database migrations by running `rails db:migrate` in the terminal.
5. Start the Rails server by running `rails server` in the terminal.

## Usage
### Rake Task
To use the Rake task, run the following command in the terminal:

```
rails nuts:calculate[directory/input.txt]
```

Where `directory/filename.txt` is the path to the input file

### Web Application
1. Start the Rails server by running rails server in the terminal.
2. Open a web browser and go to http://localhost:3000.
3. Enter the input values in the textarea and click the "Calculate" button.
4. The results will be displayed on the same page.

## Sample Input and Output
### Input:

```
1000,3000,1,1000
1000,7000,1,1000
1000,100000,1,1000
1111,3000,1,1000
1000,3000,1,1111
1111,3334,3,4444
111,3333,3,2222
111,3333,3,1000
10000,1111111,3,1111
10000,1111111,5,1111
1000,1000000,2,1000
1111,22222222,5,3333
1000,12000,5,3000
```

### Output:

```
1000,3000,1,1000,0
1000,7000,1,1000,0
1000,100000,1,1000,0
1111,3000,1,1000,0
1000,3000,1,1111,0
1111,3334,3,4444,1
111,3333,3,2222,2334
111,3333,3,1000,1335
10000,1111111,3,1111,0
10000,1111111,5,1111,0
1000,1000000,2,1000,0
1111,22222222,5,3333,0
1000,12000,5,3000,0
```

## Testing
```
rspec
```
