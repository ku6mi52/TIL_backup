array1 = [1, 1, 2]
array2 = array1.uniq
p array1
p array2
p array1.object_id
p array2.object_id

array3 = [2, 2, 3]
array4 = array3.uniq!
p array3
p array4
p array3.object_id
p array4.object_id
