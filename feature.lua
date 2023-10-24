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
user = {
	Name = "",
	Age = 0,
	setName = function(U, name) U.Name = name end,
	setAge = function(U, age) 
		if age >= 18 then
			U.Age = age
		else
			error("Возраст меньше 18!!!")
		end
	end,
	Salary = 1000;
		
}

function user:salaryPrint() print(self.Salary) end

user:setName("Dad")
-- user:setAge(10)
status, err = pcall(user.setAge,user, 10)
if not status then 
--	print(err)
else
--	print(user.Age)
end

manager = {
	Company = "Google"
}
setmetatable(manager,user);


--manager:setName("Bob")



lamp = {
  on = false,
 
}
-- через точку, тогда аргумент надо указывать
function lamp.turn_on(l) l.on = true end
 
-- через двоеточкие, тогда аргумент неявно задается сам, как переменная "self"
-- "self" - и есть та лампочка, для которой вызвали метод
function lamp:turn_off() self.on = false end
superlamp = {
  brightness = 100
}
-- указываем родительскую таблицу
setmetatable(superlamp, lamp)
-- и ее методы теперь доступны
superlamp:turn_on()
superlamp:turn_off()
