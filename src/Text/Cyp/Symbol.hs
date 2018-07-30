
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Symbol (matchBang,                  matchDoubleQuote,          matchHash,
                        matchDollar,                matchPercent,              matchConjunction,
                        matchSingleQuote,           matchOpenParen,            matchCloseParen,
                        matchAsterisk,              matchPlus,                 matchComma,
                        matchMinus,                 matchPeriod,               matchForwardSlash,
                        matchColon,                 matchSemicolon,            matchLessThan,
                        matchEquals,                matchGreaterThan,          matchQuestionMark,
                        matchAt,                    matchOpenBlock,            matchBackwardSlash,
                        matchCloseBlock,            matchHat,                  matchUnderscore,
                        matchBackQuote,             matchOpenBrace,            matchCloseBrace,
                        matchPipe,                  matchTilda,                matchOpenSmartDoubleQuote,
                        matchCloseSmartDoubleQuote, matchOpenSmartSingleQuote, matchCloseSmartSingleQuote) where
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
    matchBang :: Parser String Char
    matchBang  = matchLitChar '!'

    --
    -- | Match an double quote.
    --
    matchDoubleQuote :: Parser String Char
    matchDoubleQuote  = matchLitChar '\"'

    --
    -- | Match a hash.
    --
    matchHash :: Parser String Char
    matchHash  = matchLitChar '#'

    --
    -- | Match a dollar sign.
    --
    matchDollar :: Parser String Char
    matchDollar  = matchLitChar '$'

    --
    -- | Match a percent sign.
    --
    matchPercent :: Parser String Char
    matchPercent  = matchLitChar '%'

    --
    -- | Match conjunction.
    --
    matchConjunction :: Parser String Char
    matchConjunction  = matchLitChar '&'

    --
    -- | Match single quote.
    --
    matchSingleQuote :: Parser String Char
    matchSingleQuote  = matchLitChar '\''

    --
    -- | Match opening parenthesis.
    --
    matchOpenParen :: Parser String Char
    matchOpenParen  = matchLitChar '('

    --
    -- | Match closing parenthesis.
    --
    matchCloseParen :: Parser String Char
    matchCloseParen  = matchLitChar ')'

    --
    -- | Match an asterisk.
    --
    matchAsterisk :: Parser String Char
    matchAsterisk  = matchLitChar '*'

    --
    -- | Match plus sign.
    --
    matchPlus :: Parser String Char
    matchPlus  = matchLitChar '+'

    --
    -- | Match a comma.
    --
    matchComma :: Parser String Char
    matchComma  = matchLitChar ','

    --
    -- | Match a minus sign.
    --
    matchMinus :: Parser String Char
    matchMinus  = matchLitChar '-'

    --
    -- | Match a period.
    --
    matchPeriod :: Parser String Char
    matchPeriod  = matchLitChar '.'

    --
    -- | Match a forward slash.
    --
    matchForwardSlash :: Parser String Char
    matchForwardSlash  = matchLitChar '/'

    --
    -- | Match a colon.
    --
    matchColon :: Parser String Char
    matchColon  = matchLitChar ':'

    --
    -- | Match semi-colon.
    --
    matchSemicolon :: Parser String Char
    matchSemicolon  = matchLitChar ';'

    --
    -- | Match a less than sign.
    --
    matchLessThan :: Parser String Char
    matchLessThan  = matchLitChar '<'

    --
    -- | Match equals.
    --
    matchEquals :: Parser String Char
    matchEquals  = matchLitChar '='

    --
    -- | Match an greater than sign.
    --
    matchGreaterThan :: Parser String Char
    matchGreaterThan  = matchLitChar '>'

    --
    -- | Match a question mark.
    --
    matchQuestionMark :: Parser String Char
    matchQuestionMark  = matchLitChar '?'

    --
    -- | Match an at sign.
    --
    matchAt :: Parser String Char
    matchAt  = matchLitChar '@'

    --
    -- | Match an open block.
    --
    matchOpenBlock :: Parser String Char
    matchOpenBlock  = matchLitChar '['

    --
    -- | Match a backslash.
    --
    matchBackwardSlash :: Parser String Char
    matchBackwardSlash  = matchLitChar '\\'

    --
    -- | Match an close block.
    --
    matchCloseBlock :: Parser String Char
    matchCloseBlock  = matchLitChar ']'

    --
    -- | Match a hat.
    --
    matchHat :: Parser String Char
    matchHat  = matchLitChar '^'

    --
    -- | Match an underscore.
    --
    matchUnderscore :: Parser String Char
    matchUnderscore  = matchLitChar '_'

    --
    -- | Match a back quote.
    --
    matchBackQuote :: Parser String Char
    matchBackQuote  = matchLitChar '`'

    --
    -- | Match an opening curly brace.
    --
    matchOpenBrace :: Parser String Char
    matchOpenBrace  = matchLitChar '{'

    --
    -- | Match a pipe.
    --
    matchPipe :: Parser String Char
    matchPipe  = matchLitChar '|'

    --
    -- | Match an closing curly brace.
    --
    matchCloseBrace :: Parser String Char
    matchCloseBrace  = matchLitChar '}'

    --
    -- | Match a Tilda.
    --
    matchTilda :: Parser String Char
    matchTilda  = matchLitChar '~'

    --
    -- Match an opening smart double quote.
    --
    matchOpenSmartDoubleQuote :: Parser String Char
    matchOpenSmartDoubleQuote  = matchLitChar '“'

    --
    -- Match an closing smart double quote.
    --
    matchCloseSmartDoubleQuote :: Parser String Char
    matchCloseSmartDoubleQuote  = matchLitChar '”'

    --
    -- Match an opening smart single quote.
    --
    matchOpenSmartSingleQuote :: Parser String Char
    matchOpenSmartSingleQuote  = matchLitChar '‘'

    --
    -- Match an closing smart single quote.
    --
    matchCloseSmartSingleQuote :: Parser String Char
    matchCloseSmartSingleQuote  = matchLitChar '’'
