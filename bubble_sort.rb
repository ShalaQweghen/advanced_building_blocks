def bubble_sort(array)
	array.length.times do
		array.each_index do |i|
			if i + 1 != array.length && array[i] > array[i + 1]
				array[i], array[i + 1] = array[i + 1], array[i]
			end
		end
	end
	return array.inspect
end

def bubble_sort_by(array, &block)
	array.length.times do
		array.each_index do |i|
			if i + 1 != array.length && block.call(array[i], array[i + 1]) < 0
				array[i], array[i + 1] = array[i + 1], array[i]
			end
		end
	end
	return array.inspect
end

if $0 == "bubble_sort.rb"
	array1 = [16,17,6,7,80,37,39,65,47,91,89,21,2,6,89,2,6,99,4,87,63,33,44,55,66,22,21,45,78,8]
	array2 = ["hi","hello!","they", "bye","Mikey", "top", "a"]
	puts "Unsorted = #{array1}"
	puts "Sorted   = #{bubble_sort(array1)}"
	puts
	puts "Unsorted = #{array2}"
	puts "Sorted   = #{bubble_sort_by(array2) {|left, right| left.length - right.length}}"
end