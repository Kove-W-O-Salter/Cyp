
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

-- module Text.Cyp (parse, parsePedantic) where
--         --
--         -- For foundations.
--         --
--         import Data.Cyp
-- 
--         --
--         -- | Run the `Parser` `p` on the input stream `stream`.
--         --
--         parse          :: Parser s a -> [s] -> Maybe a
--         parse p stream  = do (x, _) <- p $> stream
--                              return x
-- 
--         --
--         -- | Run the `Parser` `p` on the input stream `stream0` and fail if the resulting stream isn't empty.
--         --
--         parsePedantic          :: Parser s a -> [s] -> Maybe a
--         parsePedantic p stream0 = do (x, stream1) <- p $> stream0
--                                      if null stream1
--                                         then Just x
--                                         else Nothing

module Text.Cyp (Parser,        parse,
                 parsePedantic, (<|>),
                 some,          many,
                 empty) where
    --
    -- For the foundations ('Parser' and all of it's class instances).
    --
    import Data.Cyp
    
    --
    -- For 'Alternative's functions.
    --
    import Control.Applicative

    -- |
    -- Run the 'Parser' p with the input stream s.
    --
    parse     :: Parser s a -> s -> Maybe a
    parse p s  = do (x, _) <- apply p s
                    return x

    -- |
    -- Run the 'Parser' p with the input stream s,
    -- failing if the resulting stream isn't empty.
    --
    parsePedantic     :: Parser [s] a -> [s] -> Maybe a
    parsePedantic p s  = do (x, s1) <- apply p s
                            if null s1 then
                                Just x
                            else
                                Nothing
