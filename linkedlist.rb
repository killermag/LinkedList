class LinkedList 

  attr_reader :current_node, :home


  def initialize 
    @home = Node.new('HOME!!!')
    @@count = 1
    @current_node = @home

  end
  
  def append (value)
    return "Already contains the value" if self.contains?(value)
    new_node = Node.new(value)
    @current_node.next_node = new_node 
    @current_node = @current_node.next_node
    @@count += 1
    
  end 

  def prepend (value) 
    return "Already contains the value" if self.contains?(value)
    new_node = Node.new(value)
    new_node.next_node = @home 
    @home = new_node
    @@count += 1 

  end
  
  def size 
    return @@count 
  end 

  def head 
    return @home 
  end 

  def tail 
    return @current_node
  end 

  def at(index)
    return if index > self.size  
    temp = @home 
    index.times {  temp = temp.next_node  } 
    temp 
  end
  
  def pop
    
    length = self.size
    if length == 1 
      @home = nil 
    elsif length == 2 
      @current_node = nil 
    elsif length > 2 
      temp = @home
      (length-2).times {
        temp = temp.next_node
      }
      temp.next_node = nil
      @current_node = temp  
      @@count -= 1 
    end   

  end 

  def contains? (value) 
    length = self.size
    temp = @home
    
    if length == 1 
      if value.is_a?(String)
        if temp.value.downcase == value.downcase 
          return true 
        else 
          return false 
        end
      end  

      if value.is_a?(Integer) 
        if temp.value == value 
          return true 
        else 
          return false 
        end
      end 
    end  
    
    length.times {
      if value.is_a?(String)
        if temp.value.downcase == value.downcase 
          return true 
        else 
          temp = temp.next_node 
        end 
      end 
      if value.is_a?(Integer)
        if temp.value == value 
          return true 
        else 
          temp = temp.next_node 
        end 
      end 
    }
    return false 
    
  end

  def find (value)
    return if !self.contains?(value)

    count = 0
    if self.size == 1 
      self.contains?(value)
      return 0 
    end 
    
    if self.size > 1 
      temp = @home
      (self.size).times {
        if temp.value == value 
          return count 
        else 
          temp = temp.next_node 
          count += 1
        end 
      }
    end
    
    return nil  

  end 

  def to_s 
    temp = @home 
    (self.size).times {
      if temp.next_node != nil 
      print "(#{temp.value}) -> "
      else   
      print "(#{temp.value}) -> nil"
      end 
      temp = temp.next_node
    }
  end 

  # -------- EXTRA CREDIT ----------------

  def insert_at (value,index)
    if index > self.size
      append(value)
      return 
    elsif index < self.size || index == 0
      prepend(value)
      return 
    end
    
    node_at_index = self.at(index)
    new_node = Node.new(value,node_at_index)
    node_before_index = self.at(index-1) 
    node_before_index.next_node = new_node
    @@count += 1

  end 

  def remove_at (index)
    return if index > self.size || index < 0 

    node_at_index = self.at(index)
    node_at_index = nil 
    node_before_index = self.at(index-1)
    node_after_index = self.at(index+1)
    node_before_index.next_node = node_after_index 
    @@count -= 1

  end 





end 

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node 
  end   

end



