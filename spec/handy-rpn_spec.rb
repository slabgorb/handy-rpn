require 'spec_helper'
describe HandyRPN do
  before :each do
    @calc = HandyRPN.new(true)
    @calc_not_strict = HandyRPN.new(false)
  end

  it "handles problems with no input" do
    expect{ @calc.calculate('')}.to raise_error("Invalid Reverse Polish Notation format: length is zero!")
  end

  it "handles problems with garbage input" do
    expect{  @calc.calculate('foo bar') }.to raise_error("Invalid Reverse Polish Notation format: syntax error at token #1 'foo'")
  end

  it "handles problem with invalid operand count" do
    expect{  @calc.calculate('1 +')}.to raise_error("Invalid Reverse Polish Notation format: not enough operands at token #2 '+'")
  end

  it "handles problem with operand after final operator" do
    expect{  @calc.calculate('1 1 + 1')}.to raise_error("Invalid Reverse Polish Notation format: invalid syntax")
  end


  it "does addition" do
    expect(@calc.calculate("1 1 +")).to eq(2)
  end

  it "does subtraction" do
    expect(@calc.calculate("1 1 -")).to eq(0)
  end

  it "does multiplication" do
    expect(@calc.calculate("2 2 *")).to eq(4)
  end

  it "does division" do
    expect(@calc.calculate("9 3 /")).to eq(3)
  end

  it "does modulo" do
    expect(@calc.calculate("20 10 %")).to eq(0)
  end

  it "does powers (hehe sneaky!)" do
    expect(@calc.calculate("2 5 **")).to eq(32)
  end

  it "does multiple operations" do
    expect(@calc.calculate("2 3 + 5 + 10 -")).to eq(0)
  end

  it "fudges sloppy syntax in non-strict mode" do
    expect(@calc_not_strict.calculate("2 2 2 * * 3 +")).to eq(11)
  end

  it "handles (with exception) on sloppy syntax in strict mode" do
    expect{ @calc.calculate("2 2 2 * * 3 +")}.to raise_error("Invalid Reverse Polish Notation format: not enough operands at token #5 '*'")
  end

  it "handles multiline input" do
    expect(@calc.calculate("
     1
     1
     +
    ")).to eq(2)

  end

  it "handles repeated operands in strict mode" do
    expect(@calc.calculate("2 2 2 2 +")).to eq(8)
  end

  it "handles a fancier example" do
    expect(@calc.calculate("
         5
         7
       + 18
       * 2
       / 2
       /
    ")).to eq(54)
  end

  it "handles floats" do
    expect(@calc.calculate("1.1 2.2 +")).to be_within(0.001).of(3.3)
  end


end
