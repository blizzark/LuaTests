a = 10
b = 20

a, b = b, a -- не нужно менять значения переменных через tmp
------

arr = {
	you = 1,
	we = 2,
	he = 3
}

-- print(arr["you"])
-- print(arr["I"])
-- print(arr.you)
--for key, value in pairs(arr) do
--	print(key, value)
--	end

-- таблица может быть как массивом, так и хэш таблицей

------------------
a = function(x) return x * 2 end 
b = function(x) return x + 1 end 
 
function apply(table, f)
  result = {}
  for k, v in pairs(table) do
    result[k] = f(v) 
  end
end
 

t = {1, 3, 5}
apply(t, a) -- переменная содержащая ссылку на функцию, как я понял, почти делегат :з 
apply(t, b)

-- print(result[1], result[2], result[3]) вывод через запятую, что-то новенькое
-------------------

-- Далее я хочу потестить все ли виды связей объектов можно реализовать в Lua

-- Наследование --
User = {}

function User:new(name, age)
	
	
	
	local obj = {}
	
	obj.Name = name
	obj.Age = age
	
	function obj:getName()
		return self.Name
	end
	
	function obj:getAge()
		if(age < 18) then
			return 18
		end
		return self.Age
	end
	
	setmetatable(obj, self)
	self.__index = self 
	return obj
end

Tom = User:new("Tom", 10)
Bob= User:new("Bob", 22)


--print(Tom:getName(), Tom:getAge());
--print(Bob:getName(), Bob:getAge());

Manager = {
	Company = "Google"
}

setmetatable(Manager ,{__index = User}) 

Sam = Manager:new("Sam", 30)
print(Sam:getName(), Sam:getAge(), Sam.Company);


--------------------------------------
--Агрегация--

Department = {}

function Department:new(name)
	
	local obj = {}
	obj.Name = name
	
	function obj:getNameDepartment()
		return self.Name
	end
	
	setmetatable(obj, self)
	self.__index = self 
	return obj
end
	
Worker = {

}

function Worker:new()
	local obj = {}
	
	function obj:setDepartment(department) 
		obj.Department = department
	end
	
	function obj:getDepartment() 
		return self.Department
	end
	
	setmetatable(obj, self)
	self.__index = self 
	return obj
end
	
	

accounting = Department:new("Accountant")

developers = Department:new("Developer")

Tim = Worker:new()
Tim:setDepartment(accounting)
Tim:setDepartment(developers)

print(Tim:getDepartment():getNameDepartment())


-- остальное понятно, что по аналогии Ассоциация, Реализация, Компоновка и т.д..













