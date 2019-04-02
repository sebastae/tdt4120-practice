function paths(x::Int64, y::Int64)
    computed = Array{Int128, 2}(undef,x,y)
    computed[1,1] = 1
    for i = 1:x
        for j = 1:y
            computed[i,j] = (i !=1 && j!=1) ? (i >1 ? computed[i-1,j] : 0) + ( j > 1 ? computed[i, j-1] : 0) : 1
        end
    end
    computed[x,y]
end

function test(a::Int64, b::Int64)
        for i = 1:a
            for j = 1:b
                res = paths(i,j)
                println("[$i, $j] $res")
            end
        end

end

test(50,50)
