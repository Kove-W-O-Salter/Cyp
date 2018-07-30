
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Integral (integral,    int,      int8,
                          int16,       int32,    int64, 
                          litIntegral, litInt,   litInt8,
                          litInt16,    litInt32, litInt64) where
    --
    -- For the foundations.
    --
    import Data.Cyp

    --
    -- For the different 'Int' types.
    --
    import Data.Int

    --
    -- For parsing 'Strings'.
    --
    import Text.Cyp.String

    --
    -- | Match a member of the 'Integral' class.
    --
    integral :: (Integral a, Read a) => Parser String a
    integral  = do ds <- digits
                   return (read ds)

    --
    -- | Match an 'Int'.
    --
    int :: Parser String Int
    int  = integral

    --
    -- | Match an 'Int8'.
    --
    int8 :: Parser String Int8
    int8  = integral

    --
    -- | Match an 'Int16'.
    --
    int16 :: Parser String Int16
    int16  = integral

    --
    -- | Match an 'Int32'.
    --
    int32 :: Parser String Int32
    int32  = integral

    --
    -- | Match an 'Int64'.
    --
    int64 :: Parser String Int64
    int64  = integral

    --
    -- | Match the member of the 'Integral' class, i.
    --
    litIntegral   :: (Integral a, Read a, Show a) => a -> Parser String a
    litIntegral i  = do ds <- litString (show i)
                        return (read ds)

    --
    -- | Match the 'Int' i.
    --
    litInt :: Int -> Parser String Int
    litInt  = litIntegral

    --
    -- | Match the 'Int8' i.
    --
    litInt8 :: Int8 -> Parser String Int8
    litInt8  = litIntegral

    --
    -- | Match the 'Int16' i.
    --
    litInt16 :: Int16 -> Parser String Int16
    litInt16  = litIntegral

    --
    -- | Match the 'Int32' i.
    --
    litInt32 :: Int32 -> Parser String Int32
    litInt32  = litIntegral

    --
    -- | Match the 'Int64' i.
    --
    litInt64 :: Int64 -> Parser String Int64
    litInt64  = litIntegral
