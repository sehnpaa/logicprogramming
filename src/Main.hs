module Main where

import Control.Monad (guard)
import GHC.Base ((<|>), Alternative)

-- If we have all possible solutions we can filter
-- out actual solutions via declarative rules.

-- "Producers" and "consumers" are terms used in one of the
-- arguments of "Why functional programming matters".

solution :: (Enum a, Eq a, Num a, Ord a) => [(a,a)]
solution = do
    -- The producers creates the solution space.
    a <- [1..10]
    b <- [1..10]

    -- The consumers reduce the solution space down to solutions.
    -- We use '<|>' to represent 'or' and an implicit bind to
    -- represent 'and':
    guard (a + b == 12)
    guard (a < 5) <|> guard (b == 2)

    -- End result:
    -- [(2,10),(3,9),(4,8),(10,2)]

    return (a,b)

main :: IO ()
main = putStrLn "Hello, Haskell!"
