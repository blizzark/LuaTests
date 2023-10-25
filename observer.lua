-- реализация паттерна Наблюдатель на Lua
-- смысл: при изменении цены на товар, происходит какое-то действие, если есть подписка
-- как я понял, интерфейсы (абстрактные классы)


-- Subject (издатель), который получает уведомления и передает их наблюдателям
local Subject = {}

function Subject:new()
    local newObj = {}
    self.__index = self
    self.observers = {}
    return setmetatable(newObj, self)
end

function Subject:attach(observer)
    table.insert(self.observers, observer)
end

function Subject:detach(observer)
    for i, obs in ipairs(self.observers) do
        if obs == observer then
            table.remove(self.observers, i)
            break
        end
    end
end

function Subject:notify()
    for _, observer in ipairs(self.observers) do
        observer:update()
    end
end

-- Observer (наблюдатель), который получает и обрабатывает уведомления от издателя
local Observer = {}

function Observer:new(name, subject)
    local newObj = { name = name, subject = subject }
    self.__index = self
    return setmetatable(newObj, self)
end

function Observer:update()
    print(self.name .. " получил уведомление от " .. self.subject)
end

-- Пример использования

local subject = Subject:new()

local observer1 = Observer:new("Наблюдатель 1", "издателя")
local observer2 = Observer:new("Наблюдатель 2", "издателя")

subject:attach(observer1)
subject:attach(observer2)

subject:notify()

subject:detach(observer1)

subject:notify()
	
	