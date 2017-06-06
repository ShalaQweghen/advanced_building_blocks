def bubble_sort(array)
	array.length.times do
		array.each_index do |i|
			if i + 1 != array.length && array[i] > array[i + 1]
				array[i], array[i + 1] = array[i + 1], array[i]
			end
		end
	end
	return array
end

def bubble_sort_by(array, &block)
	array.length.times do
		array.each_index do |i|
			if i + 1 != array.length && block.call(array[i], array[i + 1]) < 0
				array[i], array[i + 1] = array[i + 1], array[i]
			end
		end
	end
	return array
end