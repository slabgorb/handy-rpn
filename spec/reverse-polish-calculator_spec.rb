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

  it "handles problem with invalid operand count" do
    expect{  @calc.parse('1 +')}.to raise_error("Invalid Reverse Polish Notation format: not enough operands at token 2 +")
  end

  it "handles problem with operand after final operator" do
    expect{  @calc.parse('1 1 + 1')}.to raise_error("Invalid Reverse Polish Notation format: invalid syntax")
  end

  it "does addition" do
    expect(@calc.parse("1 1 +")).to eq(2)
  end

end
