module Enumerable
	def my_each(&block)
		if block_given?
			for x in self
				block.call(x)
			end
		end
		return self.to_enum(:my_each)
	end

	def my_each_with_index(&block)
		if block_given?
			idx = 0
			self.my_each do |x|
				block.call(x, idx) 
				idx += 1
			end
		end
		return self.to_enum(:my_each_with_index)
	end

	def my_select(&block)
		if block_given?
			selected = []
			self.my_each do |x|
				selected << x if block.call(x)
			end
			return selected
		end
		return self.to_enum(:my_select)
	end

	def my_all?
		if block_given?
			c = 0
			self.my_each do |x|
				c += 1 if yield(x)
			end
			return c == self.size ? true : false
		end
		return true
	end

	def my_any?
		if block_given?
			c = 0
			self.my_each do |x|
				c += 1 if yield(x)
			end
			return c > 0 ? true : false
		end
		return true
	end

	def my_none?
		if block_given?
			c = 0
			self.my_each do |x|
				c += 1 if yield(x)
			end
			return c == 0 ? true : false
		end
		return false
	end

	def my_count(*params)
		if block_given?
			c = 0
			self.my_each do |x|
				c += 1 if yield(x)
			end
			return c
		else
			return self.size
		end
	end

	def my_map(proc = nil)
		return self.to_enum(:my_map) if !proc && !block_given?
		mapped = []
		if proc || (proc && block_given?)
			self.my_each do |x|
				mapped << proc.call(x)
			end
		elsif block_given?
			self.my_each do |x|
				mapped << yield(x)
			end
		end
		return mapped
	end

	def my_inject (param=0)
		self.my_each do |x|
			param = yield(param, x)
		end
		return param
	end
end