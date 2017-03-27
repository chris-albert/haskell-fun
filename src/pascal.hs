-- Generate pascals triangle
-- 1
-- 1 1
-- 1 2 1
-- 1 3 3 1
-- 1 4 6 4 1

-- def genRow(input: List[Int]): List[Int] = ???
genRow :: [Int] -> [Int]
genRow input = sumSlide ((0:input) ++ [0])

sumSlide :: [Int] -> [Int]
sumSlide (x1:x2:xs) = (x1 + x2):sumSlide (x2:xs)
sumSlide _ = []

buildTriangle :: Int -> [[Int]]
buildTriangle 0 = [[]]
buildTriangle h = reverse (foldl (\acc _ -> (genRow (head acc)):acc) [[1]] (replicate (h - 1) 0))