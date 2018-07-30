
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Bool (matchBool, matchLitBool) where
    --
    -- For the foundation.
    --
    import Data.Cyp

    --
    -- For 'matchString'.
    --
    import Text.Cyp.String

    --
    -- For 'Alternative'.
    --
    import Control.Applicative

    --
    -- | Match a 'Bool'.
    --
    matchBool :: Parser String Bool
    matchBool  = do sb <- matchLitString "True" <|> matchLitString "False"
                    return (read sb)

    --
    -- | Match the 'Bool' b.
    --
    matchLitBool   :: Bool -> Parser String Bool
    matchLitBool b  = do matchLitString (show b)
                         return b
