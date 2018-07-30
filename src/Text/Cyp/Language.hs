
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Language (matchInfixOp,          matchPrefixOp,      matchIdentifier,
                          matchParens,           matchBraces,        matchBlocks,
                          matchAngles,           matchDoubleQuotes,  matchSingleQuotes,
                          matchBackQuotes,       matchCommaSep,      matchCommaSep1,
                          matchSemicolonSep,     matchSemicolonSep1, matchDoubleSmartQuotes,
                          matchSingleSmartQuotes) where
    --
    -- For the foundation of `Parser`s.
    --
    import Data.Cyp

    --
    -- For whitespace `Parser`.
    --
    import Text.Cyp.String

    --
    -- For matching symbols.
    --
    import Text.Cyp.Symbol

    --
    -- For various `Parser` combinators.
    --
    import Text.Cyp.Combinators

    --
    -- | Match the `Parser` `po` between the `Parser` `pa`.
    --
    matchInfixOp       :: Parser String a -> Parser String b -> Parser String (b,a,b)
    matchInfixOp po pa  = do x <- pa
                             matchSpaces
                             o <- po
                             matchSpaces
                             y <- pa
                             return (x,o,y)

    --
    -- | Match the `Parser` `po` then the `Parser` `pa`.
    --
    matchPrefixOp       :: Parser String a -> Parser String b -> Parser String (a,b)
    matchPrefixOp po pa  = do o <- po
                              matchSpaces
                              x <- pa
                              return (o,x)

    --
    -- | Match a identifier with the initial `Char` matched by `pini` and all of the remaining `Char`s matched by `pres`
    --
    matchIdentifier           :: Parser String Char -> Parser String Char -> Parser String String
    matchIdentifier pini pres  = do x  <- pini
                                    xs <- many pres
                                    return (x : xs)

    --
    -- | Match the `Parser` `p` between parenthesis.
    --
    matchParens   :: Parser String a -> Parser String a
    matchParens p  = between p matchOpenParen matchCloseParen

    --
    -- | Match the `Parser` `p` between curly braces.
    --
    matchBraces   :: Parser String a -> Parser String a
    matchBraces p  = between p matchOpenBrace matchCloseBrace

    --
    -- | Match the `Parser` `p` between block braces.
    --
    matchBlocks   :: Parser String a -> Parser String a
    matchBlocks p  = between p matchOpenBlock matchCloseBlock

    --
    -- | Match the `Parser` `p` between angle brackets.
    --
    matchAngles   :: Parser String a -> Parser String a
    matchAngles p  = between p matchLessThan matchGreaterThan

    --
    -- | Match the `Parser` `p` between double quotes.
    --
    matchDoubleQuotes   :: Parser String a -> Parser String a
    matchDoubleQuotes p  = between p matchDoubleQuote matchDoubleQuote

    --
    -- | Match the `Parser` `p` between single quotes.
    --
    matchSingleQuotes   :: Parser String a -> Parser String a
    matchSingleQuotes p  = between p matchSingleQuote matchSingleQuote

    --
    -- | Match the `Parser` `p` between back quotes.
    --
    matchBackQuotes   :: Parser String a -> Parser String a
    matchBackQuotes p  = between p matchBackQuote matchBackQuote

    --
    -- | Match the `Parser` `p` between smart double quotes.
    --
    matchDoubleSmartQuotes   :: Parser String a -> Parser String a
    matchDoubleSmartQuotes p  = between p matchOpenSmartDoubleQuote matchCloseSmartDoubleQuote

    --
    -- | Match the `Parser` `p` between smart single quotes.
    --
    matchSingleSmartQuotes   :: Parser String a -> Parser String a
    matchSingleSmartQuotes p  = between p matchOpenSmartSingleQuote matchCloseSmartSingleQuote

    --
    -- | Match many of the `Parser` `p` separated by commas.
    --
    matchCommaSep   :: Parser String a -> Parser String [a]
    matchCommaSep p  = sepBys p matchComma

    --
    -- | Match some of the `Parser` `p` separated by commas.
    --
    matchCommaSep1   :: Parser String a -> Parser String [a]
    matchCommaSep1 p  = sepBys1 p matchComma

    --
    -- | Match many of the `Parser` `p` separated by commas.
    --
    matchSemicolonSep   :: Parser String a -> Parser String [a]
    matchSemicolonSep p  = sepBys p matchSemicolon

    --
    -- | Match some of the `Parser` `p` separated by commas.
    --
    matchSemicolonSep1   :: Parser String a -> Parser String [a]
    matchSemicolonSep1 p  = sepBys1 p matchSemicolon
