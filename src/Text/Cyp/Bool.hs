
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Bool (matchBool, matchLitBool) where
        --
        -- For the: `Parser` and `Stream` types.
        --
        import Data.Cyp

        --
        -- For `matchString`.
        --
        import Text.Cyp.String

        --
        -- | Match a `Bool`.
        --
        matchBool :: Parser Char Bool
        matchBool  = matchLitString "True" ?> matchLitString "False" |> \sb ->
                     convert (read sb)

        --
        -- | Match the `Bool` b.
        --
        matchLitBool   :: Bool -> Parser Char Bool
        matchLitBool b  = matchLitString (show b) />
                          convert b
