require 'matrix'

inp = $stdin.read
arr = inp.split "\n"
x = arr[0..arr.size/2-1]
y = arr[arr.size/2.. arr.size] 
m = Matrix.rows x.map{|a| a.split(" ").map{|a| a.to_i}} 
n = Matrix.rows y.map{|a| a.split(" ").map{|a| a.to_i}}
puts (m + n)
