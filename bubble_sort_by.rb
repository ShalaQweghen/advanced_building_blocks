def bubble_sort_by (array, &block)
	a = 0
	(array.size*2).times do
		a == (array.size - 1) ? a = 0 : a
		if block.call(array[a], array[a+1]) < 0
			array[a], array[a+1] = array[a+1], array[a]
		end
		a += 1
	end
	array.inspect
end

puts bubble_sort_by(["hi","helllo","they", "bye","Mikey", "top", "a"]) {|left, right| left.length - right.length}