module ArrayHelpers

    function swap!(A, i, j)
        tmp = A[j]
        A[j] = A[i]
        A[i] = tmp
    end

end
