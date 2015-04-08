#!/usr/bin/env ruby

require_relative "lib/handy-rpn.rb"

class Calculator
  CALC_FLAG = 'c'
  QUIT_FLAG = 'q'
  HELP_FLAG = '?'

  def initialize(strict = false)
    @calc = HandyRPN.new(strict)
  end

  def self.instructions
    puts <<-END_INSTRUCTIONS
    Enter calculation, you may use multiple lines.
    To calculate, enter #{CALC_FLAG} on a line by itself,
    to quit, enter 'q',
    for this help text, enter ?
    END_INSTRUCTIONS
  end

  def main
    self.class.instructions
    while true
      puts "New calculation:"
      begin
        rpn = []
        while true
          buff = gets.strip
          case buff
          when QUIT_FLAG
            puts "Done"
            exit
          when CALC_FLAG
            break
          when HELP_FLAG
            instructions
          else
            rpn << buff
            if rpn.join == ''
              puts "Done"
              exit
            end
          end
        end
        puts "Calculaton: (#{rpn.join(' ')}) Answer: " + "%.2g" % @calc.parse(rpn.join(" "))
      rescue SystemExit, Interrupt
        exit
      rescue Exception => e
        puts "\033[1;31m#{e}\033[0m"
        rpn = []
      end
    end

  end
end

def usage
  puts "HandyRPN, the Handy Reverse Polish Calculator!"
  puts "Usage: handy-rpn [options]"
  puts "    -h, --help           this message"
end

if ARGV.length > 0
  usage
  exit
end


Calculator.new().main




