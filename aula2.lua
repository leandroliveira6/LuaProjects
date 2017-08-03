-- Aula 2

---- Exercicio 1: Empacota uma quantidade indeterminada de elementos e retorna sem o ultimo
function primeiros(...)
	local t = table.pack(...)
	table.remove(t)
	return table.unpack(t)
end

print("EXERCICIO 1")
print("RESULTADOS ESPERADOS: '', '', '1, 2'")
print(primeiros())
print(primeiros(1))
print(primeiros(1,2,3))
print()


--[[ Exercicio 2: Escreva um programa completo em Lua que recebe uma lista de nomes de
arquivos como parâmetros de linha de comando e imprime na saida padrão o
conteúdo desses arquivos, um seguido do outro]]
---- file:read("l"), file:read("L"), file:lines(), file:read("a"), file:read(N), etc.
function cat(...)
	local arquivos = table.pack(...)
	local str = ""
	for i=1, arquivos.n do
		local arquivo = io.open(arquivos[i], "r")
		str = str .. arquivo:read("a")
		arquivo:close()
	end
	return str
end

print("EXERCICIO 2")
print("RESULTADOS ESPERADOS: '', 'abc', 'abcabc'")
print("'" .. cat() .. "'")
print("'" .. cat("aula2.txt") .. "'")
print("'" .. cat("aula2.txt", "aula2.txt") .. "'")