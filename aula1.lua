-- Aula 1

---- Exercicio 1: Função fatorial
function fat(entrada)
	local total = 1
	for i=2,entrada do
		total = total * i
	end
	return total
end

print("EXERCICIO 1")
print("RESULTADOS ESPERADOS: 1, 1, 2, 6")
print(fat(0), fat(1), fat(2), fat(3))
print()


---- Exercicio 1.1: Função fatorial recursiva
function fatrec(entrada)
	if entrada<2 then
		return 1
	else
		return entrada * fatrec(entrada-1)
	end
end

print("EXERCICIO 1.1")
print("RESULTADOS ESPERADOS: 1, 1, 2, 6")
print(fat(0), fat(1), fat(2), fat(3))
print()


---- Observações: Limite dos inteiros
---- print("O limite dos inteiros é de " .. -(1<<63) .. " até " .. (1<<63)-1)


---- Exercicio 2: Inserir uma string dentro de outra string na posição desejada
---- insert("abcd", 2, "XXX") --> "aXXXbcd"
function insert(ent, pos, ins)
	return string.sub(ent, 1, pos-1) .. ins .. string.sub(ent, pos)
end

print("EXERCICIO 2")
print("RESULTADO ESPERADO: aXXXbcd")
print(insert("abcd", 2, "XXX"))
print()


---- Exercicio 3: Concatenar arrays
-- concatarray({"h", "e", "l"}, {"l", "o"}) --> {"h", "e", "l", "l", "o"}
-- concatarray({30,20,10}, {50, 40}) --> {30,20,10,50,40}
function concatarray(entrada, ins)
	for key, valor in pairs(ins) do
		table.insert(entrada, valor)
	end
	return entrada
end

function mostrar_tabela(tabela)
	local str = "{"
	for k, v in pairs(tabela) do
		if type(k) == "string" then
			str = str .. k .. "=" .. v .. ", "
		else
			str = str .. v .. ", "			
		end
	end
	print(string.sub(str, 1, #str-2) .. "}")
end

print("EXERCICIO 3")
print("RESULTADOS ESPERADOS: {h, e, l, l, o}, {30, 20, 10, 50, 40}")
mostrar_tabela(concatarray({"h", "e", "l"}, {"l", "o"}))
mostrar_tabela(concatarray({30,20,10}, {50, 40}))
print()


---- Exercicio 4: Faz a união de dois arrays
-- mergetable( {x=1}, {y=2} ) --> {x=1, y=2}
-- mergetable( {x=1, z=3}, {y=2, z=4} ) --> {x=1, y=2, z=4}
-- mergetable( {10,20,30}, {x=1, y=2} ) --> {x=1, y=2, 10, 20, 30}
function mergetable(entrada, ins)
	for key, valor in pairs(ins) do
		entrada[key] = valor
		--table.insert(entrada, valor)
	end
	return entrada
end

print("EXERCICIO 4")
print("RESULTADOS ESPERADOS: {x=1, y=2}, {x=1, y=2, z=4}, {10, 20, 30, x=1, y=2}")
mostrar_tabela(mergetable({x=1}, {y=2}))
mostrar_tabela(mergetable({x=1, z=3}, {y=2, z=4}))
mostrar_tabela(mergetable({10,20,30}, {x=1, y=2}))
print()


---- Exercicio 5: Conversão de bases
-- evalpoly({3, 2, 1}, 5) --> 3 + 2*5 + 1*5^2 --> 38
-- evalpoly({-1, 3, -3, 1}, 4)  --> -1 +3*4 -3*4^2 + 1*4^3 --> 27
function evalpoly(entrada, base)
	local exp, total = 0, 0
	for i, valor in pairs(entrada) do
		total = total + valor * base ^ exp
		exp = exp + 1
	end
	return total
end

print("EXERCICIO 5")
print("RESULTADOS ESPERADOS: 38, 27")
print(evalpoly({3, 2, 1}, 5))
print(evalpoly({-1, 3, -3, 1}, 4))
print()


---- Exercicio 5.1: Implementar evalpoly sem usar o operador de exponenciação (^).
-- Dica: a*x^2 + b*x + c = ((a*x + b)*x + c)
function evalpolyrec(entrada, base)
	if #entrada == 0 then 
		return 0
	else
		return table.remove(entrada, 1) + base * evalpolyrec(entrada, base)
	end
end

print("EXERCICIO 5.1")
print("RESULTADOS ESPERADOS: 38, 27")
print(evalpolyrec({3, 2, 1}, 5))
print(evalpolyrec({-1, 3, -3, 1}, 4))