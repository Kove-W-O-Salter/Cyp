
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Fractional (matchFractional,    matchFloat,    matchDouble,
                            matchLitFractional, matchLitFloat, matchLitDouble) where
    --
    -- For the foundation.
    --
    import Data.Cyp

    --
    -- For 'String' 'Parser's.
    --
    import Text.Cyp.String

    --
    -- For 'Char' 'Parser's.
    --
    import Text.Cyp.Char

    --
    -- | Match a member of the 'Fractional' class.
    --
    matchFractional :: (Fractional f, Read f) => Parser String f
    matchFractional  = do l <- matchDigits
                          matchLitChar '.'
                          r <- matchDigits
                          return $ read $ l ++ "." ++ r

    --
    -- | Match a 'Float'.
    --
    matchFloat :: Parser String Float
    matchFloat  = matchFractional

    --
    -- | Match a 'Double'.
    --
    matchDouble :: Parser String Double
    matchDouble  = matchFractional

    --
    -- | Match the member of the 'Fractional' class, f.
    --
    matchLitFractional   :: (Fractional f, Read f, Show f) => f -> Parser String f
    matchLitFractional f  = do matchLitString (show f)
                               return f

    --
    -- | Match the 'Float', f.
    --
    matchLitFloat :: Float -> Parser String Float
    matchLitFloat  = matchLitFractional

    --
    -- | Match the 'Double', d.
    --
    matchLitDouble :: Double -> Parser String Double
    matchLitDouble  = matchLitFractional
