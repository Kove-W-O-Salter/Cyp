
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Fractional (fractional,    float,    double,
                            litFractional, litFloat, litDouble) where
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
    fractional :: (Fractional f, Read f) => Parser String f
    fractional  = do l <- digits
                     litChar '.'
                     r <- digits
                     return $ read $ l ++ "." ++ r

    --
    -- | Match a 'Float'.
    --
    float :: Parser String Float
    float  = fractional

    --
    -- | Match a 'Double'.
    --
    double :: Parser String Double
    double  = fractional

    --
    -- | Match the member of the 'Fractional' class, f.
    --
    litFractional   :: (Fractional f, Read f, Show f) => f -> Parser String f
    litFractional f  = do litString (show f)
                          return f

    --
    -- | Match the 'Float', f.
    --
    litFloat :: Float -> Parser String Float
    litFloat  = litFractional

    --
    -- | Match the 'Double', d.
    --
    litDouble :: Double -> Parser String Double
    litDouble  = litFractional
