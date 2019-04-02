import ArrayHelpers
module Heaps

    left(i) = 2i
    right(i) = 2i+1

    function maxheapify!(A::AbstractArray{Int, 1}, i::Int)
        l = left(i)
        r = right(i)

        if l <= size(A) && A[l] > A[i]
            m = l
        else
            m = i
        end

        if r <= size(A) && A[r] > A[l]
            m = r
        end

        if m != i
            ArrayHelpers.swap!(A, m, i)
            maxheapify!(A, m)
        end

    end

end
