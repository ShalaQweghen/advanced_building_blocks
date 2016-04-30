def bubble_sort array
	array.length.times do
		array.each_index do |i|
			if !(i+1 > array.length-1)
				if array[i] > array[i+1]
					array[i], array[i+1] = array[i+1], array[i]
				end
			end
		end
	end
	array.inspect
end

puts bubble_sort [16,17,6,7,80,37,39,65,47,91,89,21,2,6,89,2,6,99,4,87,63,33,44,55,66,22,21,45,78,8]