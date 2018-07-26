
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Symbol (matchBang,        matchDoubleQuote, matchHash,
                        matchDollar,      matchPercent,     matchConjunction,
                        matchSingleQuote, matchOpenParen,   matchCloseParen,
                        matchAsterisk,    matchPlus,        matchComma,
                        matchMinus,       matchPeriod,      matchForwardSlash,
                        matchColon,       matchSemicolon,   matchLessThan,
                        matchEquals,      matchGreaterThan, matchQuestionMark,
                        matchAt,          matchOpenBlock,   matchBackwardSlash,
                        matchCloseBlock,  matchHat,         matchUnderscore, 
                        matchBackQuote,   matchOpenBrace,   matchCloseBrace, 
                        matchPipe,        matchTilda) where
        --
        -- For the `Parser` foundation.
        --
        import Data.Cyp

        --
        -- For `Char` `Parser`s.
        --
        import Text.Cyp.Char

        --
        -- Match a bang.
        --
        matchBang :: Parser Char Char
        matchBang  = matchLitChar '!'

        --
        -- Match an double quote.
        --
        matchDoubleQuote :: Parser Char Char
        matchDoubleQuote  = matchLitChar '\"'

        --
        -- Match a hash.
        --
        matchHash :: Parser Char Char
        matchHash  = matchLitChar '#'

        --
        -- Match a dollar sign.
        --
        matchDollar :: Parser Char Char
        matchDollar  = matchLitChar '$'

        --
        -- Match a percent sign.
        --
        matchPercent :: Parser Char Char
        matchPercent  = matchLitChar '%'

        --
        -- Match conjunction.
        --
        matchConjunction :: Parser Char Char
        matchConjunction  = matchLitChar '&'

        --
        -- Match single quote.
        --
        matchSingleQuote :: Parser Char Char
        matchSingleQuote  = matchLitChar '\''

        --
        -- Match opening parenthesis.
        --
        matchOpenParen :: Parser Char Char
        matchOpenParen  = matchLitChar '('

        --
        -- Match closing parenthesis.
        --
        matchCloseParen :: Parser Char Char
        matchCloseParen  = matchLitChar ')'

        --
        -- Match an asterisk.
        --
        matchAsterisk :: Parser Char Char
        matchAsterisk  = matchLitChar '*'

        --
        -- Match plus sign.
        --
        matchPlus :: Parser Char Char
        matchPlus  = matchLitChar '+'

        --
        -- Match a comma.
        --
        matchComma :: Parser Char Char
        matchComma  = matchLitChar ','

        --
        -- Match a minus sign.
        --
        matchMinus :: Parser Char Char
        matchMinus  = matchLitChar '-'

        --
        -- Match a period.
        --
        matchPeriod :: Parser Char Char
        matchPeriod  = matchLitChar '.'

        --
        -- Match a forward slash.
        --
        matchForwardSlash :: Parser Char Char
        matchForwardSlash  = matchLitChar '/'

        --
        -- Match a colon.
        --
        matchColon :: Parser Char Char
        matchColon  = matchLitChar ':'

        --
        -- Match semi-colon.
        --
        matchSemicolon :: Parser Char Char
        matchSemicolon  = matchLitChar ';'

        --
        -- Match a less than sign.
        --
        matchLessThan :: Parser Char Char
        matchLessThan  = matchLitChar '<'

        --
        -- Match equals.
        --
        matchEquals :: Parser Char Char
        matchEquals  = matchLitChar '='

        --
        -- Match an greater than sign.
        --
        matchGreaterThan :: Parser Char Char
        matchGreaterThan  = matchLitChar '>'

        --
        -- Match a question mark.
        --
        matchQuestionMark :: Parser Char Char
        matchQuestionMark  = matchLitChar '?'

        --
        -- Match an at sign.
        --
        matchAt :: Parser Char Char
        matchAt  = matchLitChar '@'

        --
        -- Match an open block.
        --
        matchOpenBlock :: Parser Char Char
        matchOpenBlock  = matchLitChar '['

        --
        -- Match a backslash.
        --
        matchBackwardSlash :: Parser Char Char
        matchBackwardSlash  = matchLitChar '\\'

        --
        -- Match an close block.
        --
        matchCloseBlock :: Parser Char Char
        matchCloseBlock  = matchLitChar ']'

        --
        -- Match a hat.
        --
        matchHat :: Parser Char Char
        matchHat  = matchLitChar '^'

        --
        -- Match an underscore.
        --
        matchUnderscore :: Parser Char Char
        matchUnderscore  = matchLitChar '_'

        --
        -- Match a back quote.
        --
        matchBackQuote :: Parser Char Char
        matchBackQuote  = matchLitChar '`'

        --
        -- Match an opening curly brace.
        --
        matchOpenBrace :: Parser Char Char
        matchOpenBrace  = matchLitChar '{'

        --
        -- Match a pipe.
        --
        matchPipe :: Parser Char Char
        matchPipe  = matchLitChar '|'

        --
        -- Match an closing curly brace.
        --
        matchCloseBrace :: Parser Char Char
        matchCloseBrace  = matchLitChar '}'

        --
        -- Match a Tilda.
        --
        matchTilda :: Parser Char Char
        matchTilda  = matchLitChar '~'
