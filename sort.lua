-- чисто потыкать, что за язык
print("Реализация алгоритма сортировки на языке Lua")

maxSizeArray = 20

function PrintArray(arr)
	local s = ""
	for i=1,#arr do
		s = s .. arr[i] .. " ";
	end;
	print(s);
end

function InsertionSort(arr)
	for i = 2, #arr do
		local j = i;
		local key = arr[i];
		
		while (j > 1 and arr[j-1] > key) do
			arr[j] = arr[j-1]
			j = j-1
		end
		arr[j] = key;
	end;

end;



arr = {};
s = "";

print("Изначальный (неотсортированный) массив")
for i=1,maxSizeArray do
	arr[i] =  math.random(-100,100);
end;
PrintArray(arr)

print("Сортировка вставками")
InsertionSort(arr);
PrintArray(arr)







	




