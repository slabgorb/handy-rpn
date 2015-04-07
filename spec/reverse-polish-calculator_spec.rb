require 'spec_helper'
describe ReversePolishCalculator do
  before :each do
    @calc = ReversePolishCalculator.new
  end

  it "handles problems with no input" do
    expect{ @calc.parse('')}.to raise_error("Invalid Reverse Polish Notation format: length is zero!")
  end

  it "handles problems with garbage input" do
    expect{  @calc.parse('foo bar') }.to raise_error("Invalid Reverse Polish Notation format: syntax error at token 1 'foo'")
  end

end
