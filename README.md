# handy-rpn

A Handy (see what I did there) Reverse Polish Notation Calculator!



To run tests:

    git clone https://github.com/slabgorb/handy-rpn.git
    cd handy-rpn
    bundle install
    bundle exec rspec -fd

To run application:

    git clone https://github.com/slabgorb/handy-rpn.git
    cd handy-rpn
    ./handy-rpn


Example run:

    handy-rpn|master⚡ ⇒ ./handy-rpn
        Enter calculation, you may use multiple lines.
        To calculate, enter c on a line by itself,
        to quit, enter 'q',
        for this help text, enter ?
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

From Wikipedia: http://en.wikipedia.org/wiki/Reverse_Polish_notation

*   While there are input tokens left
    *   Read the next token from input.
    *   If the token is a value
        *   Push it onto the stack.
    *   Otherwise, the token is an operator (operator here includes both operators and functions).
        *   It is known that the operator takes **n** arguments.
        *   If there are fewer than **n** values on the stack
            *   **(Error)** The user has not input sufficient values in the expression.
        *   Else, Pop the top **n** values from the stack.
        *   Evaluate the operator, with the values as arguments.
        *   Push the returned results, if any, back onto the stack.
*   If there is only one value in the stack
    *   That value is the result of the calculation.
*   Otherwise, there are more values in the stack
    *   **(Error)** The user input has too many values.
