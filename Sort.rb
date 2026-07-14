def bubble_sort(array)
  size = array.length

  (0...size - 1).each do |i|
    (0...(size - i - 1)).each do |j|
      if array[j] > array[j + 1]
        array[j], array[j + 1] = array[j + 1], array[j]
      end
    end
  end

  print array
end

bubble_sort([4, 3, 78, 2, 0, 2])