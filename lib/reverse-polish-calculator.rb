class ReversePolishCalculator
  MIN_TOKENS = 2
  def initialize(strict = false)
    @strict = strict
    @stack = []
  end

  def error(extra_message)
    ArgumentError.new("Invalid Reverse Polish Notation format: " + extra_message)
  end

  # parses a RPN string, e.g.
  # (2 3 + 5 + 10 -)
  # Invalid RPN:
  # (2 2 2 * * 3 +)
  def parse(input)
    raise error("length is zero!") unless input.length > 0
    # break input string on whitespace for tokens.
    tokens = input.strip.split(/\s+/m)
    tokens.each_with_index do |token, index|
      raise error("syntax error at token ##{index + 1} '#{token}'") unless token =~ /\d+|[*-\/+]/
      # if this is an operand, add it to the stack
      if token =~ /\d/
        @stack << token.to_i
      else
        raise error("not enough operands at token ##{index + 1} '#{token}'") if (@stack.length < MIN_TOKENS && @strict)
        # if it is an operator, take the operands off the stack and apply the operator to them
        while @stack.length > 1
          first, second = @stack.pop(MIN_TOKENS)
          @stack << first.send(token, second)
        end
      end
    end
    raise error("invalid syntax") unless @stack.length == 1
    @stack.pop
  end

end
