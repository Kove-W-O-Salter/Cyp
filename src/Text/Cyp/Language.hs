
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Language (infixOp,          prefixOp,      identifier,
                          parens,           braces,        blocks,
                          angles,           doubleQuotes,  singleQuotes,
                          backQuotes,       commaSep,      commaSep1,
                          semicolonSep,     semicolonSep1, doubleSmartQuotes,
                          singleSmartQuotes) where
    --
    -- For the foundation.
    --
    import Data.Cyp

    --
    -- For whitespace 'Parser'.
    --
    import Text.Cyp.String

    --
    -- For ing symbols.
    --
    import Text.Cyp.Symbol

    --
    -- For various 'Parser' combinators.
    --
    import Text.Cyp.Combinators

    --
    -- | Match the 'Parser' 'po' between the 'Parser' 'pa'.
    --
    infixOp       :: Parser String a -> Parser String b -> Parser String (b,a,b)
    infixOp po pa  = do x <- pa
                        spaces
                        o <- po
                        spaces
                        y <- pa
                        return (x,o,y)

    --
    -- | Match the 'Parser' 'po' then the 'Parser' 'pa'.
    --
    prefixOp       :: Parser String a -> Parser String b -> Parser String (a,b)
    prefixOp po pa  = do o <- po
                         spaces
                         x <- pa
                         return (o,x)

    --
    -- | Match a identifier with the initial 'Char' ed by 'pini' and all of the remaining 'Char's ed by 'pres'
    --
    identifier           :: Parser String Char -> Parser String Char -> Parser String String
    identifier pini pres  = do x  <- pini
                               xs <- many pres
                               return (x : xs)

    --
    -- | Match the 'Parser' 'p' between parenthesis.
    --
    parens   :: Parser String a -> Parser String a
    parens p  = between p openParen closeParen

    --
    -- | Match the 'Parser' 'p' between curly braces.
    --
    braces   :: Parser String a -> Parser String a
    braces p  = between p openBrace closeBrace

    --
    -- | Match the 'Parser' 'p' between block braces.
    --
    blocks   :: Parser String a -> Parser String a
    blocks p  = between p openBlock closeBlock

    --
    -- | Match the 'Parser' 'p' between angle brackets.
    --
    angles   :: Parser String a -> Parser String a
    angles p  = between p lessThan greaterThan

    --
    -- | Match the 'Parser' 'p' between double quotes.
    --
    doubleQuotes   :: Parser String a -> Parser String a
    doubleQuotes p  = between p doubleQuote doubleQuote

    --
    -- | Match the 'Parser' 'p' between single quotes.
    --
    singleQuotes   :: Parser String a -> Parser String a
    singleQuotes p  = between p singleQuote singleQuote

    --
    -- | Match the 'Parser' 'p' between back quotes.
    --
    backQuotes   :: Parser String a -> Parser String a
    backQuotes p  = between p backQuote backQuote

    --
    -- | Match the 'Parser' 'p' between smart double quotes.
    --
    doubleSmartQuotes   :: Parser String a -> Parser String a
    doubleSmartQuotes p  = between p openSmartDoubleQuote closeSmartDoubleQuote

    --
    -- | Match the 'Parser' 'p' between smart single quotes.
    --
    singleSmartQuotes   :: Parser String a -> Parser String a
    singleSmartQuotes p  = between p openSmartSingleQuote closeSmartSingleQuote

    --
    -- | Match many of the 'Parser' 'p' separated by commas.
    --
    commaSep   :: Parser String a -> Parser String [a]
    commaSep p  = sepBys p comma

    --
    -- | Match some of the 'Parser' 'p' separated by commas.
    --
    commaSep1   :: Parser String a -> Parser String [a]
    commaSep1 p  = sepBys1 p comma

    --
    -- | Match many of the 'Parser' 'p' separated by commas.
    --
    semicolonSep   :: Parser String a -> Parser String [a]
    semicolonSep p  = sepBys p semicolon

    --
    -- | Match some of the 'Parser' 'p' separated by commas.
    --
    semicolonSep1   :: Parser String a -> Parser String [a]
    semicolonSep1 p  = sepBys1 p semicolon
