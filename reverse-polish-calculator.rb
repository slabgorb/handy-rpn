#!/usr/bin/env ruby

class ReversePolishCalculator
  NICE_ERROR = "Invalid Reverse Polish Notation format"

  def initialize
    @register = []
  end

  # parses a RPN string, e.g.
  # (2 3 + 5 + 10 -)
  # (2 2 2 * * 3 +)
  def parse(input)
    input.strip!
    raise ArgumentError.new(NICE_ERROR + ": length is zero!") unless input.length > 0
    # break input string on space for tokens.
    tokens = input.split(' ')
    # make sure all input is valid
    tokens.each_with_index do |token, index|
      unless token =~ /\d+|[*-\/+]/
        raise ArgumentError.new(NICE_ERROR + ": syntax error at token #{index + 1} '#{token}'")
      end
    end
  end

end
