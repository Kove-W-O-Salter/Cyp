
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Symbol (bang,                  doubleQuote,          hash,
                        dollar,                percent,              conjunction,
                        singleQuote,           openParen,            closeParen,
                        asterisk,              plus,                 comma,
                        minus,                 period,               forwardSlash,
                        colon,                 semicolon,            lessThan,
                        equals,                greaterThan,          questionMark,
                        at,                    openBlock,            backwardSlash,
                        closeBlock,            hat,                  underscore,
                        backQuote,             openBrace,            closeBrace,
                        pipe,                  tilda,                openSmartDoubleQuote,
                        closeSmartDoubleQuote, openSmartSingleQuote, closeSmartSingleQuote) where
    --
    -- For the 'Parser' foundation.
    --
    import Data.Cyp

    --
    -- For 'Char' 'Parser's.
    --
    import Text.Cyp.Char

    --
    -- | Match a bang.
    --
    bang :: Parser String Char
    bang  = litChar '!'

    --
    -- | Match an double quote.
    --
    doubleQuote :: Parser String Char
    doubleQuote  = litChar '\"'

    --
    -- | Match a hash.
    --
    hash :: Parser String Char
    hash  = litChar '#'

    --
    -- | Match a dollar sign.
    --
    dollar :: Parser String Char
    dollar  = litChar '$'

    --
    -- | Match a percent sign.
    --
    percent :: Parser String Char
    percent  = litChar '%'

    --
    -- | Match conjunction.
    --
    conjunction :: Parser String Char
    conjunction  = litChar '&'

    --
    -- | Match single quote.
    --
    singleQuote :: Parser String Char
    singleQuote  = litChar '\''

    --
    -- | Match opening parenthesis.
    --
    openParen :: Parser String Char
    openParen  = litChar '('

    --
    -- | Match closing parenthesis.
    --
    closeParen :: Parser String Char
    closeParen  = litChar ')'

    --
    -- | Match an asterisk.
    --
    asterisk :: Parser String Char
    asterisk  = litChar '*'

    --
    -- | Match plus sign.
    --
    plus :: Parser String Char
    plus  = litChar '+'

    --
    -- | Match a comma.
    --
    comma :: Parser String Char
    comma  = litChar ','

    --
    -- | Match a minus sign.
    --
    minus :: Parser String Char
    minus  = litChar '-'

    --
    -- | Match a period.
    --
    period :: Parser String Char
    period  = litChar '.'

    --
    -- | Match a forward slash.
    --
    forwardSlash :: Parser String Char
    forwardSlash  = litChar '/'

    --
    -- | Match a colon.
    --
    colon :: Parser String Char
    colon  = litChar ':'

    --
    -- | Match semi-colon.
    --
    semicolon :: Parser String Char
    semicolon  = litChar ';'

    --
    -- | Match a less than sign.
    --
    lessThan :: Parser String Char
    lessThan  = litChar '<'

    --
    -- | Match equals.
    --
    equals :: Parser String Char
    equals  = litChar '='

    --
    -- | Match an greater than sign.
    --
    greaterThan :: Parser String Char
    greaterThan  = litChar '>'

    --
    -- | Match a question mark.
    --
    questionMark :: Parser String Char
    questionMark  = litChar '?'

    --
    -- | Match an at sign.
    --
    at :: Parser String Char
    at  = litChar '@'

    --
    -- | Match an open block.
    --
    openBlock :: Parser String Char
    openBlock  = litChar '['

    --
    -- | Match a backslash.
    --
    backwardSlash :: Parser String Char
    backwardSlash  = litChar '\\'

    --
    -- | Match an close block.
    --
    closeBlock :: Parser String Char
    closeBlock  = litChar ']'

    --
    -- | Match a hat.
    --
    hat :: Parser String Char
    hat  = litChar '^'

    --
    -- | Match an underscore.
    --
    underscore :: Parser String Char
    underscore  = litChar '_'

    --
    -- | Match a back quote.
    --
    backQuote :: Parser String Char
    backQuote  = litChar '`'

    --
    -- | Match an opening curly brace.
    --
    openBrace :: Parser String Char
    openBrace  = litChar '{'

    --
    -- | Match a pipe.
    --
    pipe :: Parser String Char
    pipe  = litChar '|'

    --
    -- | Match an closing curly brace.
    --
    closeBrace :: Parser String Char
    closeBrace  = litChar '}'

    --
    -- | Match a Tilda.
    --
    tilda :: Parser String Char
    tilda  = litChar '~'

    --
    -- Match an opening smart double quote.
    --
    openSmartDoubleQuote :: Parser String Char
    openSmartDoubleQuote  = litChar '“'

    --
    -- Match an closing smart double quote.
    --
    closeSmartDoubleQuote :: Parser String Char
    closeSmartDoubleQuote  = litChar '”'

    --
    -- Match an opening smart single quote.
    --
    openSmartSingleQuote :: Parser String Char
    openSmartSingleQuote  = litChar '‘'

    --
    -- Match an closing smart single quote.
    --
    closeSmartSingleQuote :: Parser String Char
    closeSmartSingleQuote  = litChar '’'
