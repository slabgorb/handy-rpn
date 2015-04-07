require_relative "../reverse-polish-calculator.rb"
describe ReversePolishCalculator do
  before :each do
    @calc = ReversePolishCalculator.new
  end

  it "handles problems with no input" do
    expect{ @calc.parse('')}.to raise_error
  end




end



