
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

-- module Text.Cyp.Fractional where
--         --
--         -- For the: `Parser` and `Stream` types.
--         --
--         import Data.Cyp

--         --
--         -- For `String` `Parser`s.
--         --
--         import Text.Cyp.String

--         --
--         -- For `Char` `Parser`s.
--         --
--         import Text.Cyp.Char

--         --
--         -- | Match a member of the `Fractional` class.
--         --
--         matchFractional :: (Fractional f, Read f) => Parser f
--         matchFractional  = do l <- matchDigits
--                               matchLitChar '.'
--                               r <- matchDigits
--                               let f = l ++ "." ++ r
--                               return $ read f

--         --
--         -- | Match a `Float`.
--         --
--         matchFloat :: Parser Float
--         matchFloat  = matchFractional

--         --
--         -- | Match a `Double`.
--         --
--         matchDouble :: Parser Double
--         matchDouble  = matchFractional

--         --
--         -- | Match the member of the `Fractional` class, `f`.
--         --
--         matchLitFractional   :: (Fractional f, Read f, Show f) => f -> Parser f
--         matchLitFractional f  = do matchLitString (show f)
--                                    return f

--         --
--         -- | Match the `Float`, `f`.
--         --
--         matchLitFloat :: Float -> Parser Float
--         matchLitFloat  = matchLitFractional

--         --
--         -- | Match the `Double`, `d`.
--         --
--         matchLitDouble :: Double -> Parser Double
--         matchLitDouble  = matchLitFractional

-- !!!!!!!! BEGIN EXPERIMENTAL !!!!!!!! --

module Text.Cyp.Fractional (matchFractional,    matchFloat,    matchDouble,
                            matchLitFractional, matchLitFloat, matchLitDouble) where
        --
        -- For the: `Parser` and `Stream` types.
        --
        import Data.Cyp

        --
        -- For `String` `Parser`s.
        --
        import Text.Cyp.String

        --
        -- For `Char` `Parser`s.
        --
        import Text.Cyp.Char

        --
        -- | Match a member of the `Fractional` class.
        --
        matchFractional :: (Fractional f, Read f) => Parser Char f
        matchFractional  = matchDigits                    |> \l ->
                           matchLitChar '.'               />
                           matchDigits                    |> \r ->
                           convert $ read $ l ++ "." ++ r

        --
        -- | Match a `Float`.
        --
        matchFloat :: Parser Char Float
        matchFloat  = matchFractional

        --
        -- | Match a `Double`.
        --
        matchDouble :: Parser Char Double
        matchDouble  = matchFractional

        --
        -- | Match the member of the `Fractional` class, `f`.
        --
        matchLitFractional   :: (Fractional f, Read f, Show f) => f -> Parser Char f
        matchLitFractional f  = matchLitString (show f) />
                                convert f

        --
        -- | Match the `Float`, `f`.
        --
        matchLitFloat :: Float -> Parser Char Float
        matchLitFloat  = matchLitFractional

        --
        -- | Match the `Double`, `d`.
        --
        matchLitDouble :: Double -> Parser Char Double
        matchLitDouble  = matchLitFractional

-- !!!!!!!! END EXPERIMENTAL !!!!!!!! --