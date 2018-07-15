
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Int where
        --
        -- For the: `Parser` and `Stream` types.
        --
        import Data.Cyp

        --
        -- For the different `Int` types.
        --
        import Data.Int

        --
        -- For parsing `Strings`.
        --
        import Text.Cyp.String

        --
        -- | Match a member of the `Integral` class.
        --
        matchIntegral :: (Integral a, Read a) => Parser a
        matchIntegral  = do ds <- matchDigits
                            return (read ds)

        --
        -- | Match an `Int`.
        --
        matchInt :: Parser Int
        matchInt  = matchIntegral

        --
        -- | Match an `Int8`.
        --
        matchInt8 :: Parser Int8
        matchInt8  = matchIntegral

        --
        -- | Match an `Int16`.
        --
        matchInt16 :: Parser Int16
        matchInt16  = matchIntegral

        --
        -- | Match an `Int32`.
        --
        matchInt32 :: Parser Int32
        matchInt32  = matchIntegral

        --
        -- | Match an `Int64`.
        --
        matchInt64 :: Parser Int64
        matchInt64  = matchIntegral

        --
        -- | Match the member of the `Integral` class, i.
        --
        matchLitIntegral   :: (Integral a, Read a, Show a) => a -> Parser a
        matchLitIntegral i  = do ds <- matchString (show i)
                                 return (read ds)

        --
        -- | Match the `Int` i.
        --
        matchLitInt :: Int -> Parser Int
        matchLitInt  = matchLitIntegral

        --
        -- | Match the `Int8` i.
        --
        matchLitInt8 :: Int8 -> Parser Int8
        matchLitInt8  = matchLitIntegral

        --
        -- | Match the `Int16` i.
        --
        matchLitInt16 :: Int16 -> Parser Int16
        matchLitInt16  = matchLitIntegral

        --
        -- | Match the `Int32` i.
        --
        matchLitInt32 :: Int32 -> Parser Int32
        matchLitInt32  = matchLitIntegral

        --
        -- | Match the `Int64` i.
        --
        matchLitInt64 :: Int64 -> Parser Int64
        matchLitInt64  = matchLitIntegral
