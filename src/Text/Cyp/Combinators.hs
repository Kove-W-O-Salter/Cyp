
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Combinators (many,          some,        between,
                             termBy,        sepBys,      sepBys1,
                             sepTermBys,    sepTermBys1, saveWith) where
        --
        -- For the: `Parser` and `Stream` types.
        --
        import Data.Cyp

        --
        -- | Match zero or more occurences of the `Parser` `p`.
        --
        many   :: Parser s a -> Parser s [a]
        many p  = some p ?> convert []

        --
        -- | Match one or more occurences of the `Parser` `p`.
        --
        some   :: Parser s a -> Parser s [a]
        some p  = p                |> \x ->
                  many p           |> \xs ->
                  convert (x : xs)

        --
        -- | Match the `Parser` x between the `Parser`s x and y.
        --
        between       :: Parser s a -> Parser s b -> Parser s c -> Parser s a
        between x y z  = y />
                         x |> \a ->
                         z /> convert a

        --
        -- | Match one of the `Parser` p separated by the `Parser` q.
        --
        termBy     :: Parser s a -> Parser s b -> Parser s a
        termBy p q  = p |> \x ->
                      q /> convert x

        --
        -- | Match zero or more of the `Parser` p separated by the `Parser` q.
        --
        sepBys     :: Parser s a -> Parser s b -> Parser s [a]
        sepBys p q  = (many (termBy p q)   |> \xs ->
                          p                   |> \x  ->
                          convert (xs ++ [x] )) ?> convert []

        --
        -- | Match one or more of the `Parser` p separated by the `Parser` q.
        --
        sepBys1     :: Parser s a -> Parser s b -> Parser s [a]
        sepBys1 p q  = (p |> \x -> convert [x]) ?> (termBy p q     |> \x  ->
                                                      sepBys p q   |> \xs ->
                                                      convert (x : xs))

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
        saveWith a p  = Parser (\stream0 ->
                case p $> stream0 of
                        Nothing              -> Just (a, stream0)
                        Just    (x, stream1) -> Just (x, stream1))
