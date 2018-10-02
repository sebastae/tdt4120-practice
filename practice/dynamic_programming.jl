f(A, i::Tuple{Int64, Int64}) = A[i[1]]>1 ? A[i[1],(i[2]>1 ? i[2]-1 : 1):(i[2]<size(A)[2] ? i[2]+1 : i[2])] : -1

function cumulative(weights::AbstractArray{Int64, 2})
    cml = weights
    for i = 2:size(weights)[2]
        for j = 1:size(weights)[1]
            cml[i,j] = cml[i,j] + minimum(f(cml, (i-1,j)))
        end
    end
    return cml
end

function back_track(path_weights::AbstractArray{Int64, 2})
    rows, cols = size(path_weights)
    cells = []
    ac = 1:cols
    c = path_weights[rows, 1:cols]
    for i = rows:-1:1
        index = findmin(path_weights[i, ac])[2] + ac[1] - 1
        push!(cells, (i, index))
        ac = (index>1 ? index-1 : index) : (index<cols ? index+1 : index)
    end
    cells
end

# Test

weights = [3  6  8 6 3;
           7  6  5 7 3;
           4  10 4 1 6;
           10 4  3 1 2;
           6  1  7 3 9]

expected_weights = [3  6  8  6  3;
                    10 9  11 10 6;
                    13 19 13 7  12;
                    23 17 10 8  9;
                    23 11 15 11 17]

expected_path = [(5,2), (4,3), (3,4), (2,5), (1,5)]


@assert cumulative(weights) == expected_weights
@assert back_track(expected_weights) == expected_path
