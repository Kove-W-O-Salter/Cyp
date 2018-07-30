
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Combinators (many,          some,          (<|>),
                             empty,         between,       termBy,
                             sepBys,        sepBys1,       sepTermBys,
                             sepTermBys1,   saveWith) where
    --
    -- For the: `Parser` and `Stream` types.
    --
    import Data.Cyp

    --
    -- For 'Alternative' functions.
    --
    import Control.Applicative

    --
    -- | Match the `Parser` x between the `Parser`s x and y.
    --
    between       :: Parser s a -> Parser s b -> Parser s c -> Parser s a
    between x y z  = do y
                        a <- x
                        z
                        return a

    --
    -- | Match one of the `Parser` p separated by the `Parser` q.
    --
    termBy     :: Parser s a -> Parser s b -> Parser s a
    termBy p q  = do x <- p
                     q
                     return x

    --
    -- | Match zero or more of the `Parser` p separated by the `Parser` q.
    --
    sepBys     :: Parser s a -> Parser s b -> Parser s [a]
    sepBys p q  = (many (termBy p q)   >>= \xs ->
                      p                >>= \x  ->
                      return (xs ++ [x])) <|> return []

    --
    -- | Match one or more of the `Parser` p separated by the `Parser` q.
    --
    sepBys1     :: Parser s a -> Parser s b -> Parser s [a]
    sepBys1 p q  = (p >>= \x -> return [x]) <|> (termBy p q   >>= \x  ->
                                                 sepBys p q   >>= \xs ->
                                                 return (x : xs))

    --
    -- | Match zero or more of the `Parser` `p` separated by the `Parser` `q`, followed by `q`.
    --
    sepTermBys     :: Parser s a -> Parser s b -> Parser s [a]
    sepTermBys p q  = many (termBy p q)

    --
    -- | Match one or more of the `Parser` `p` separated by the `Parser` `q`, followed by `q`.
    --
    sepTermBys1     :: Parser s a -> Parser s b -> Parser s [a]
    sepTermBys1 p q  = some (termBy p q)

    --
    -- | Attempt to match the `Parser` `p`, success resulting in `p`'s result and failure resulting in `a`.
    --
    saveWith     :: a -> Parser s a -> Parser s a
    saveWith a p  = P (\stream0 ->
            case apply p stream0 of
                    Nothing              -> Just (a, stream0)
                    Just    (x, stream1) -> Just (x, stream1))
