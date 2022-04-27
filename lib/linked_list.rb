require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # Add element to the beginning of the list if the list is empty
  def prepend(node)
    node.next_node = head
    self.head = node 
  end

# adds a node to the end of the list 
  def append(node)
    return prepend(node) unless head
    last_node = head
    while last_node.next_node
      last_node = last_node.next_node
    end
    # and add the node to the end
    last_node.next_node = node
  end

  # delete the head node
  def delete_head
    return unless head
    self.head = self.head.next_node
  end

# removes the node at the end of the list
  def delete_tail
    return unless head
    return delete_head if head.next_node.nil?

    current = head
    previous = nil
    while current.next_node
      previous = current
      current = current.next_node
    end
    previous.next_node = nil
  end


# adds a node after the given index of the linked list
  def add_after(index, node)
    return prepend(node) if index == 0

    curr_index = 0
    curr = head
    while curr_index < index
      curr_index += 1
      curr = curr.next_node
    end
    if curr
      node.next_node = curr.next_node
      curr.next_node = node
    else
    append(node)
  end
end

# finds a node with the given value within the list
def search(value)
  node = head
  while node 
    return node if node.data == value
    node = node.next_node
  end
  nil
end

end
