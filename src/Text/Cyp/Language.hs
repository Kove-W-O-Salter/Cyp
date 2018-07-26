
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Language () where
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
        -- Match the `Parser` `po` between the `Parser` `pa`.
        --
        matchInfixOp       :: Parser Char a -> Parser Char b -> Parser Char (b,a,b)
        matchInfixOp po pa  = pa              |> \x ->
                              matchSpaces     />
                              po              |> \o ->
                              matchSpaces     />
                              pa              |> \y ->
                              convert (x,o,y)

        --
        -- Match the `Parser` `po` then the `Parser` `pa`.
        --
        matchPrefixOp       :: Parser Char a -> Parser Char b -> Parser Char (a,b)
        matchPrefixOp po pa  = po            |> \o ->
                               matchSpaces   />
                               pa            |> \x ->
                               convert (o,x)

        --
        -- Match a identifier with the initial `Char` matched by `pini` and all of the remaining `Char`s matched by `pres`
        --
        matchIdentifier           :: Parser Char Char -> Parser Char Char -> Parser Char String
        matchIdentifier pini pres  = pini             |> \x  ->
                                     many pres        |> \xs ->
                                     convert (x : xs)

        --
        -- Match the `Parser` `p` between parenthesis.
        --
        matchParens   :: Parser Char a -> Parser Char a
        matchParans p  = between matchOpenParen p matchCloseParen

        --
        -- Match the `Parser` `p` between curly braces.
        --
        matchBraces   :: Parser Char a -> Parser Char a
        matchBraces p  = between matchOpenBrace p matchCloseBrace

        --
        -- Match the `Parser` `p` between block braces.
        --
        matchBlocks   :: Parser Char a -> Parser Char a
        matchBlocks p  = between matchOpenBlock p matchCloseBlock

        --
        -- Match the `Parser` `p` between angle brackets.
        --
        matchAngles   :: Parser Char a -> Parser Char a
        matchAngles p  = between matchLessThan p matchGreaterThan

        --
        -- Match the `Parser` `p` between double quotes.
        --
        matchDoubleQuotes   :: Parser Char a -> Parser Char a
        matchDoubleQuotes p  = between matchDoubleQuote p matchDoubleQuote

        --
        -- Match the `Parser` `p` between single quotes.
        --
        matchSingleQuotes   :: Parser Char a -> Parser Char a
        matchSingleQuotes p  = between matchSingleQuote p matchSingleQuote

        --
        -- Match the `Parser` `p` between back quotes.
        --
        matchBackQuotes   :: Parser Char a -> Parser Char a
        matchBackQuotes p  = between matchBackQuote p matchBackQuote

        --
        -- Match many of the `Parser` `p` separated by commas.
        --
        matchCommaSep   :: Parser Char a -> Parser Char [a]
        matchCommaSep p  = sepBys p matchComma

        --
        -- Match some of the `Parser` `p` separated by commas.
        --
        matchCommaSep1   :: Parser Char a -> Parser Char [a]
        matchCommaSep1 p  = sepBys1 p matchComma

        --
        -- Match many of the `Parser` `p` separated by commas.
        --
        matchSemicolonSep   :: Parser Char a -> Parser Char [a]
        matchSemicolonSep p  = sepBys p matchSemicolon

        --
        -- Match some of the `Parser` `p` separated by commas.
        --
        matchSemicolonSep1   :: Parser Char a -> Parser Char [a]
        matchSemicolonSep1 p  = sepBys1 p matchSemicolon
