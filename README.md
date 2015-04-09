# handy-rpn

A Handy (see what I did there) Reverse Polish Notation Calculator! I used a similar convention to the Unix rpn tool where the calculation occurs when you enter a special character on a new line, letting you construct the statement across multiple lines.



## Tests

    git clone https://github.com/slabgorb/handy-rpn.git
    cd handy-rpn
    bundle install
    bundle exec rspec -fd


    HandyRPN
      handles problems with no input
      handles problems with garbage input
      handles problem with invalid operand count
      handles problem with operand after final operator
      does addition (+)
      does subtraction (-)
      does multiplication (*)
      does division (/)
      does modulo (%)
      does exponents (hehe sneaky!) (**)
      does multiple operations
      fudges sloppy syntax in non-strict mode
      handles (with exception) on sloppy syntax in strict mode
      handles multiline input
      handles repeated operands in strict mode
      handles a fancier example
      handles floats

    Finished in 0.00508 seconds (files took 0.14728 seconds to load)
    17 examples, 0 failures

## Running Application

    git clone https://github.com/slabgorb/handy-rpn.git
    cd handy-rpn
    ./handy-rpn

## Example Run

    handy-rpn|master⚡ ⇒ ./handy-rpn
        Enter calculation, you may use multiple lines.
        To calculate, enter #{CALC_FLAG} by itself on a line,
        to quit, enter 'q' by itself on a line,
        For this help text, enter '?' by itself on a line.
    New calculation:
    2 3 + 5 + 10 -
    c
    Calculation: (2 3 + 5 + 10 -) Answer: 0
    New calculation:
    2 2 2 * * 3 +
    c
    Calculation: (2 2 2 * * 3 +) Answer: 11
    New calculation:
    2
    2
    +
    5
    +
    c
    Calculation: (2 2 + 5 +) Answer: 18
    New calculation:
    2 2 **
    c
    Calculation: (2 2 **) Answer: 4
    New calculation:
    6 3 %
    c
    Calculation: (6 3 %) Answer: 0
    New calculation:
    6 4 %
    c
    Calculation: (6 4 %) Answer: 2
    New calculation:
    q
    Done

