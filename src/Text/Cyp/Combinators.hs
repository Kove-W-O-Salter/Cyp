
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

-- module Text.Cyp.Combinators where
--         --
--         -- For the: `Parser` and `Stream` types.
--         --
--         import Data.Cyp

--         --
--         -- For the `Alternative` classes functions.
--         --
--         import Control.Applicative

--         --
--         -- | Match the `Parser` x between the `Parser`s x and y.
--         --
--         between       :: Parser a -> Parser b -> Parser c -> Parser a
--         between x y z  = do y
--                             a <- x
--                             z
--                             return a

--         --
--         -- | Match one of the `Parser` p separated by the `Parser` q.
--         --
--         sepBy     :: Parser a -> Parser b -> Parser a
--         sepBy p q  = do x <- p
--                         q
--                         return x

--         --
--         -- | Match zero or more of the `Parser` p separated by the `Parser` q.
--         --
--         manySepBy     :: Parser a -> Parser b -> Parser [a]
--         manySepBy p q  = many (sepBy p q)

--         --
--         -- | Match one or more of the `Parser` p separated by the `Parser` q.
--         --
--         someSepBy     :: Parser a -> Parser b -> Parser [a]
--         someSepBy p q  = some (sepBy p q)

-- !!!!!!!! BEGIN EXPERIMENTAL !!!!!!!! --

module Text.Cyp.Combinators (many,  some,      between,
                             sepBy, manySepBy, someSepBy) where
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
        sepBy     :: Parser s a -> Parser s b -> Parser s a
        sepBy p q  = p |> \x ->
                     q /> convert x

        --
        -- | Match zero or more of the `Parser` p separated by the `Parser` q.
        --
        manySepBy     :: Parser s a -> Parser s b -> Parser s [a]
        manySepBy p q  = many (sepBy p q)

        --
        -- | Match one or more of the `Parser` p separated by the `Parser` q.
        --
        someSepBy     :: Parser s a -> Parser s b -> Parser s [a]
        someSepBy p q  = some (sepBy p q)

-- !!!!!!!! END EXPERIMENTAL !!!!!!!! --
