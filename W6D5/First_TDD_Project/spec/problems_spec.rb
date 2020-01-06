require 'problems'
require 'rspec'

describe "Array" do

  describe "my_uniq" do
    let(:array) { [1, 2, 1, 3, 3] }
    it "returns unique elements" do
      expect(array.my_uniq).to eq([1,2,3])
    end
  end

  describe "two_sum" do
    let(:array) { [-1, 0, 2, -2, 1] }
    let(:array_1) { [0, 2, 1] }

    it "finds all pairs of position where the elements sums to zero" do
        expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns empty array when there are no pairs" do
      expect(array_1.two_sum).to eq([])
    end
  end

  describe "my_transpose" do
    let(:array) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

    it "changes rows to columns" do
        expect(array.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

    it "doesn't call the tranpose method" do
        expect(array).to_not receive(:transpose)
    end

  end

end

describe "stock_picker" do
    let(:array) { [5, 10, 6, 17] }
    
    it "picks best pair of days to buy and sell stocks" do
        expect(stock_picker(array)).to eq([0, 3])
    end

end

