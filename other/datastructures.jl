module DataStructures

export DoubleLinkedList

    module DoubleLinkedList

    export Node, LinkedList, Search, Insert!, Delete!

        mutable struct Node
            key::Int
            next::Union{Node, Nothing}
            prev::Union{Node, Nothing}
        end

        mutable struct LinkedList
            head::Union{Node, Nothing}
            tail::Union{Node, Nothing}
        end

        function Search(L::LinkedList, key::Int)
            node = L.head
            while node != nothing && node.key != key
                node = node.next
            end
            node
        end

        function Insert!(L::LinkedList, node::Node)
            node.next = L.head
            if L.head != nothing
                L.head.prev = node
            end
            L.head = node
        end

        function Delete!(L::LinkedList, node::Node)
            nothing
        end

    end

end
