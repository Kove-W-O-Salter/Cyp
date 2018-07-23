
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

-- module Text.Cyp.Bool where
--         --
--         -- For the: `Parser` and `Stream` types.
--         --
--         import Data.Cyp

--         --
--         -- For the `Bool` type.
--         --
--         import Data.Bool

--         --
--         -- For `matchString`.
--         --
--         import Text.Cyp.String

--         --
--         -- For the `Alternative` class' functions.
--         --
--         import Control.Applicative

--         --
--         -- | Match a `Bool`.
--         --
--         matchBool :: Parser Bool
--         matchBool  = do sb <- matchLitString "True" <|>
--                               matchLitString "False"
--                         return (read sb)

--         --
--         -- | Match the `Bool` b.
--         --
--         matchLitBool   :: Bool -> Parser Bool
--         matchLitBool b  = do s <- matchLitString (show b)
--                              return (read s)

-- !!!!!!!! BEGIN EXPERIMENTAL !!!!!!!! --

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

-- !!!!!!!! END EXPERIMENTAL !!!!!!!! --
