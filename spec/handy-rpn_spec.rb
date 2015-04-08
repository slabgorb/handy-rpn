require 'spec_helper'
describe HandyRPN do
  before :each do
    @calc = HandyRPN.new(true)
    @calc_not_strict = HandyRPN.new(false)
  end

  it "handles problems with no input" do
    expect{ @calc.parse('')}.to raise_error("Invalid Reverse Polish Notation format: length is zero!")
  end

  it "handles problems with garbage input" do
    expect{  @calc.parse('foo bar') }.to raise_error("Invalid Reverse Polish Notation format: syntax error at token #1 'foo'")
  end

  it "handles problem with invalid operand count" do
    expect{  @calc.parse('1 +')}.to raise_error("Invalid Reverse Polish Notation format: not enough operands at token #2 '+'")
  end

  it "handles problem with operand after final operator" do
    expect{  @calc.parse('1 1 + 1')}.to raise_error("Invalid Reverse Polish Notation format: invalid syntax")
  end

  it "does addition" do
    expect(@calc.parse("1 1 +")).to eq(2)
  end

  it "does multiple operations" do
    expect(@calc.parse("2 3 + 5 + 10 -")).to eq(0)
  end

  it "fudges sloppy syntax in non-strict mode" do
    expect(@calc_not_strict.parse("2 2 2 * * 3 +")).to eq(11)
  end

  it "handles on sloppy syntax in non-strict mode" do
    expect{ @calc.parse("2 2 2 * * 3 +")}.to raise_error("Invalid Reverse Polish Notation format: not enough operands at token #5 '*'")
  end

  it "handles multiline input" do
    expect(@calc.parse("
     1
     1
     +
    ")).to eq(2)

  end

  it "handles repeated operands in strict mode" do
    expect(@calc.parse("2 2 2 2 +")).to eq(8)
  end

  it "handles a fancier example" do
    expect(@calc.parse("
         5
         7
       + 18
       * 2
       / 2
       /
    ")).to eq(54)
  end


end
