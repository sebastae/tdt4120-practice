function counting_sort!(A,B,k,key)
     C = []
     for i = 1:k
          append!(C, [0])
     end

     for j = 1:size(A,1)
          C[key(A[j])] = C[key(A[j])] + 1
     end

     for i = 2:k
          C[i] = C[i] + C[i-1]
     end

     for j = size(A,1):-1:1
          B[C[key(A[j])]] = A[j]
          C[key(A[j])] = C[key(A[j])] - 1
     end

end

function counting_sort_letters(A,pos)
     B = fill("",size(A,1))
     counting_sort!(A,B,26, s -> Int(s[pos]) - 96)
     return B
end

function counting_sort_length(A)
     B = fill("", size(A,1))
     mx = 0
     for s in A
          if length(s) > mx
               mx = length(s)
          end
     end
     counting_sort!(A,B,mx+1,s -> length(s)+1)
     return B
end
