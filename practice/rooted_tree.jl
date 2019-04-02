struct Node
    children::Dict{Char,Node}
    posi::Array{Int}
end

# Practice code

function parse_string(str::String)
        A = []
        tempStr = ""
        index = 1
        for i ∈ 1:length(str)
                if str[i] == ' '
                        push!(A, (tempStr, index))
                        tempStr = ""
                        index = i+1
                else
                        tempStr = tempStr * str[i]
                end
                if i == length(str)
                        push!(A, (tempStr, index))
                end
        end
        return A
end


function build(words)
        head = Node(Dict(), [])
        for word ∈ words
                w = word[1]
                i = word[2]
                node = head
                for letter ∈ w
                        if !(haskey(node.children, letter))
                                node.children[letter] = Node(Dict(), [])
                        end
                        node = node.children[letter]
                end
                push!(node.posi, i)
        end
        return head
end

function position(str::String, node::Node; index=1)
        indecies = []
        nd = node
        for l ∈ index:length(str)
                if str[l] == '?'
                        for k ∈ keys(nd.children)
                                
                        end
                end
                if haskey(nd.children, str[l])
                        nd = nd.children[str[l]]
                end
        end
        append!(indecies, nd.posi)
        return indecies
end

println(position("t?o", build(parse_string("one two tro"))))
