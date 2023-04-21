module Main where

-- import qualified MyLib (someFunc)
import Data.Void

main :: IO ()
main = interact reverse


yes :: a -> Bool
yes _ = True

elseFun :: IO()
elseFun = do
  putStrLn "end"

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f ( f x )

sumOfSquare :: Int -> Int
sumOfSquare n = sum [x^2 | x <-[1 .. n]]

grid :: Int -> Int -> [(Int, Int)]
grid n m = [(x, y) | x <- [0 .. n], y <- [0 .. m]]

square :: Int -> [(Int, Int)]
square n = [(x, y) | (x, y) <- grid n n, x /= y]

newReplicate :: Int -> a -> [a]
newReplicate n e = [ e | x <- [1 .. n]]

pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z)| x <- [1 .. n], y <- [1 .. n], z <- [1 .. n], x^2 + y^2 == z^2]

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (factors x) - x == x]


square2 :: [Int]
square2 = concat [[x | x <- [1, 2]], [y | y <- [3, 4]]]

find :: Eq a => a -> [(a,b)] -> [b]
find k t = [v | (k',v) <- t, k == k']

positions :: Eq a => a -> [a] -> [Int]
positions n l = find n (zip l [i | i <- [1 .. length l]])

scaleproduct :: [Int] -> [Int] -> Int
scaleproduct l1 l2 = 3

factorial :: [Int] -> Int
factorial [] = 1
factorial (x:xs) | x < 0 = factorial(xs)
                 |otherwise = x * factorial(xs)

sumOfDown :: Int -> Int
sumOfDown 0 = 0
sumOfDown n = n + sumOfDown(n - 1)

(^-) :: Int -> Int -> Int
0 ^- x = 0
e ^- 0 = 1
e ^- x = e * (e ^- (x - 1))

greater :: Int -> Int -> Int
greater n m | n == 0 = 0
            | m == 0 = 0
greater n m | n == m = n
            | n > m = greater (n - m) m
            | n < m = greater n (m - n)

newand :: [Bool] -> Bool
newand [] = True
newand (x:xs) | x == True = newand(xs)
              | otherwise = False


newconcat :: [[a]] -> [a]
newconcat [] = []
newconcat (x:xs) = x ++ newconcat xs

newreplicate :: Int -> a -> [a]
newreplicate 0 m = []
newreplicate n m = m : newreplicate (n - 1) m

(!!+) :: [a] -> Int -> a
[x] !!+ _ = x
(x:xs) !!+ 0 = x
(x:xs) !!+ n | n - 1 < length xs = xs !!+ (n - 1)
             |otherwise = x

newelem :: Eq a => a -> [a] -> Bool
newelem e [] = False
newelem e (x:xs) | e == x = True
              | otherwise = newelem e xs

newmerge :: Ord a => [a] -> [a] -> [a]
newmerge [] xs = xs
newmerge (x:xs) l= x : newmerge xs l

hoForAll :: (a -> Bool) -> [a] -> [a]
hoForAll f [] = []
hoForAll f (x:xs) | f x == True = x:hoForAll f xs
                   | otherwise = hoForAll f xs

newAll :: Ord a => (a -> Bool) -> [a] -> Bool
newAll f l = length (hoForAll f l) == 0

dec2int :: [Int] -> Int
dec2int = foldl (\x y -> x*10 + y) 0

add1 :: (Int, Int) -> Int
add1 (x, y) = x + y
newcurry :: ((a,b) -> a) -> a -> b -> a
newcurry f x y = f(x, y)

data Nat = Zero | Succ Nat deriving (Show)
add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)
mult :: Nat -> Nat -> Nat
mult Zero n = Zero
mult m Zero = Zero
mult m (Succ n) = (add m (mult m n))

strlen :: IO ()
strlen = do putStr "Enter a string: "
            xs <- getLine
            putStr "The string has "
            putStr (show (length xs))
            putStr " characters."
            putStr "\n"

descre :: Int -> [Int]
descre 0 = []
descre n = n : descre (n - 1)
