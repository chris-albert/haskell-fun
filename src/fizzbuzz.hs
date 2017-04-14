-- [translateIndex n | n <- [1..20]]

main :: IO()
-- main = mapM_ putStrLn res
main = do
  putStrLn "How many elemets would you like to FizzBuzz"
  to <- getLine
  let toInt = read to :: Int
  --mapM_ putStrLn (map tir [1..toInt])
  mapM_ (putStrLn . tir) [1 .. toInt]

translateIndex :: Int -> String
translateIndex n
  | n `mod` 15 == 0 = "FizzBuzz"
  | n `mod` 3 == 0  = "Fizz"
  | n `mod` 5 == 0  = "Buzz"
  | otherwise       = show n

modThree :: Int -> Bool
modThree n = n `mod` 3 == 0

modFive :: Int -> Bool
modFive n = n `mod` 5 == 0

modThreeAndFive :: Int -> Bool
modThreeAndFive n = modFive n && modThree n

anything :: Int -> Bool
anything _ = True

fizzBuzzFuncs :: [(Int -> Bool,Int -> String)]
fizzBuzzFuncs = [(modThreeAndFive,const "FizzBuzz"),(modThree,const "Fizz"),(modFive,const "Buzz"),(anything,show)]

asdf :: Int -> [(Int -> Bool,Int -> String)] -> String
asdf n (f:rest)
  | r = snd f n
  | otherwise = asdf n rest
  where r = fst f n

tir :: Int -> String
tir n = asdf n fizzBuzzFuncs
