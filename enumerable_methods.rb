# I didn't use any of the defined methods in another defined method.

module Enumerable
	def my_each &block
		for x in self
			block.call(x)
		end
	end

	def my_each_with_index &block
		for x in self
			block.call(x, self.index(x))
		end
	end

	def my_select &block
		selected = []
		for x in self
			if block.call(x)
				selected << x
			end
		end
		selected
	end

	def my_all?
		c = 0
		for x in self
			yield(x) ? c += 1 : c
		end
		c == self.size ? true : false
	end

	def my_any?
		c = 0
		for x in self
			yield(x) ? c += 1 : c
		end
		c > 0 ? true : false
	end

	def my_none?
		c = 0
		for x in self
			yield(x) ? c += 1 : c
		end
		c == 0 ? true : false
	end

	def my_count (*params)
		c = 0
		if block_given?
			for x in self
				if yield(x)
					c += 1
				end
			end
			c
		else
			for x in self
				if params.size > 0
					if params[0] == x
						c += 1
					end
				else
					c += 1
				end
			end
			c
		end
	end

	def my_map (proc=0)
		mapped = []
		if block_given?
			for x in self
				mapped << yield(x)
			end
			mapped.inspect
		else
			for x in self
				mapped << proc.call(x)
			end
			mapped.inspect
		end
	end

	def my_inject (param=self[0])
		for x in self
			param = yield(param, x)
		end
		param
	end
end