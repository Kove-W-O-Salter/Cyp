
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp where
        --
        -- For access to: `Parser` and `Stream`.
        --
        import Data.Cyp

        --
        -- For access to all character `Parser`s.
        --
        import Text.Cyp.Char

        --
        -- For access to all `Integral` `Parser`s.
        --
        import Text.Cyp.Integral

        --
        -- For access to all `Fractional` `Parser`s.
        --
        import Text.Cyp.Fractional

        --
        -- For access to all `Bool` `Parser`s.
        --
        import Text.Cyp.Bool

        --
        -- For access to all `String` `Parser`s.
        --
        import Text.Cyp.String

        --
        -- For access to all `Parser` combinators.
        --
        import Text.Cyp.Combinators

        --
        -- For the `Alternative` class' functions.
        --
        import Control.Applicative

        --
        -- | Run the `Parser` p on the input `Stream` stream0.
        --
        parseCyp           :: Parser a -> Stream -> Maybe a
        parseCyp p stream0  = case apply p stream0 of
                Nothing              -> Nothing
                Just    (x, stream1) -> Just x

        --
        -- | Run the `Parser` p on the input `Stream` stream0 and, additionaly, fail if their is any remaining input.
        --
        parseCypPedantic           :: Parser a -> Stream -> Maybe a
        parseCypPedantic p stream0  = case apply p stream0 of
                Nothing              -> Nothing
                Just    (x, stream1) ->
                        if null stream1
                                then Just x
                                else Nothing

        --
        -- | Run the `Parser` q if, and only if, the `Parser` p fails.
        --
        (>>!) :: Parser a -> Parser a -> Parser a
        (>>!)  = (<|>)

        --
        -- | Match zero of more occurences of the `Parser` p, returning the concatenation of each result.
        --
        manyOf   :: Parser a -> Parser [a]
        manyOf    = many

        --
        -- | Match one of more occurences of the `Parser` p, returning the concatenation of each result.
        --
        someOf   :: Parser a -> Parser [a]
        someOf    = some
