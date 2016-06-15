require_relative "../enumerable_methods.rb"

describe Enumerable do

	let(:my_array) do
		my_array = [1,2,3]
	end

	describe "#my_each" do
		it "returns the same results as '#each'" do
			expect(my_array.my_each { |n| n += 10 }) == [11,12,13]
		end
	end

	describe "#my_each_with_index" do
		it "returns the same results as '#each_with_index'" do
			expect(my_array.my_each_with_index { |n, idx| my_array[idx] = n += idx }) == [1,3,5]
		end
	end

	describe "#my_select" do
		it "returns the same results as '#select'" do
			expect(my_array.my_select { |n| n == 2 }).to eql([2])
		end
	end

	describe "#my_all?" do
		it "returns the same results as '#all?'" do
			expect(my_array.my_all? { |n| n < 4 }).to be true
			expect(my_array.my_all? { |n| n < 3 }).to be false
		end
	end

	describe "#my_any?" do
		it "returns the same results as '#any?'" do
			expect(my_array.my_any? { |n| n < 2 }).to be true
			expect(my_array.my_any? { |n| n > 3 }).to be false
		end
	end

	describe "#my_none?" do
		it "returns the same results as '#none?'" do
			expect(my_array.my_none? { |n| n < 1 }).to be true
			expect(my_array.my_none? { |n| n > 1 }).to be false
		end
	end

	describe "#my_count" do
		it "returns the same results as '#count'" do
			expect(my_array.my_count { |n| n < 3 }).to eql(2)
		end
	end

	describe "#my_map" do
		it "returns the same results as '#map'" do
			expect(my_array.my_map { |n| n + 2 }).to eql([3,4,5])
		end
	end

	describe "#my_inject" do
		it "returns the same results as '#inject'" do
			expect(my_array.my_inject { |a, b| a + b }).to eql(6)
			expect(my_array.my_inject(10) { |a, b| a + b }).to eql(16)
		end
	end
end