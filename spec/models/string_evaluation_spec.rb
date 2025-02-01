require 'rails_helper'

RSpec.describe StringEvaluation, type: :model do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringEvaluation.add("")).to eq(0)
    end

    it "returns the number itself if only one number is provided" do
      expect(StringEvaluation.add("1")).to eq(1)
    end

    it "returns sum of two numbers" do
      expect(StringEvaluation.add("1,2")).to eq(3)
    end

    it "returns sum of multiple numbers" do
      expect(StringEvaluation.add("1,2,3,4,5")).to eq(15)
    end

    it "handles new line as a delimiter" do
      expect(StringEvaluation.add("1\n2,3")).to eq(6)
    end

    it "supports different delimiters" do
      expect(StringEvaluation.add("//;\n1;2;3")).to eq(6)
    end

    it "raises an error for negative numbers" do
      expect { StringEvaluation.add("1,-2,3,-4") }.to raise_error("negatives not allowed: -2, -4")
    end

    it "ignores numbers greater than 1000" do
      expect(StringEvaluation.add("2,1001")).to eq(2)
    end

    it "supports delimiters of any length" do
      expect(StringEvaluation.add("//[***]\n1***2***3")).to eq(6)
    end

    it "supports multiple delimiters" do
      expect(StringEvaluation.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it "supports multiple delimiters with length longer than one char" do
      expect(StringEvaluation.add("//[***][%%]\n1***2%%3")).to eq(6)
    end
  end
end
