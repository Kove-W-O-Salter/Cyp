
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Bool (bool, litBool) where
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
    bool :: Parser String Bool
    bool  = do sb <- litString "True" <|> litString "False"
               return (read sb)

    --
    -- | Match the 'Bool' b.
    --
    litBool   :: Bool -> Parser String Bool
    litBool b  = do litString (show b)
                    return b
