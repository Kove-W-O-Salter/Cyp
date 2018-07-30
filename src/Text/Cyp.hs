
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

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
