module InsertionSortOving
    export InsertionSort
    export ISTest

    function InsertionSort(A::AbstractArray)
        for j = 2:length(A)
            key = A[j]
            i = j-1
            while i > 0 && A[i] > key
                A[i+1] = A[i]
                i = i-1
            end
            A[i+1] = key
        end
        return A
    end

    function ISTest(size::Integer, maxSize::Integer)
        A = fill(0, (size))
        # Fill A with random values
        for i = 1:size
            A[i] = rand(UInt32) % maxSize
        end

        println(A)
        AS = InsertionSort(A)
        println(A)

    end

end
