require 'debugger'

def binary_search(target, collection, min_index = 0, max_index = nil)
  max_index = collection.size - 1 unless max_index


  return -1 if collection.empty? || max_index < min_index

  middle_index = min_index + ((max_index - min_index) / 2)

  return case
         when collection[middle_index] == target
           middle_index
         when collection[middle_index] < target
           binary_search(target, collection, (min_index + 1), max_index)
         when collection[middle_index] > target
           binary_search(target, collection, min_index, (middle_index - 1))
         end
end
