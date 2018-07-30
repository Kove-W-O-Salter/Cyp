
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Char (satisfy,  control,    space,
                      lower,    upper,      alpha,
                      alphaNum, printable,  digit,
                      octDigit, hexDigit,   letter,
                      mark,     number,     punctuation,
                      symbol,   separator,  ascii,
                      latin1,   asciiUpper, asciiLower,
                      char,     litChar) where
    --
    -- For foundation
    --
    import Data.Cyp

    --
    -- For 'Char' satisfyicates.
    --
    import Data.Char

    --
    -- | Match a 'Char' that satisfies the satisfyicate 'p'.
    --
    satisfy   :: (Char -> Bool) -> Parser String Char
    satisfy p  = P (\stream0 ->
        case stream0 of
                []            -> Nothing
                (x : stream1) ->
                        if p x
                                then Just (x, stream1)
                                else Nothing)

    --
    -- | Match a control 'Char'.
    --
    control :: Parser String Char
    control  = satisfy isControl

    --
    -- | Match a whitespace 'Char'.
    --
    space :: Parser String Char
    space  = satisfy isSpace

    --
    -- | Match a lower case 'Char'.
    --
    lower :: Parser String Char
    lower  = satisfy isLower

    --
    -- | Match an upper case 'Char'.
    --
    upper :: Parser String Char
    upper  = satisfy isUpper

    --
    -- | Match an alphabetic 'Char'.
    --
    alpha :: Parser String Char
    alpha  = satisfy isAlpha

    --
    -- | Match an alphabetic 'Char' or a digit 'Char'.
    --
    alphaNum :: Parser String Char
    alphaNum  = satisfy isAlphaNum

    --
    -- | Match a printableable 'Char'.
    --
    printable :: Parser String Char
    printable  = satisfy isPrint

    --
    -- | Match an ASCII digit 'Char'.
    --
    digit :: Parser String Char
    digit  = satisfy isDigit

    --
    -- | Match an ASCII octal digit 'Char'.
    --
    octDigit :: Parser String Char
    octDigit  = satisfy isOctDigit

    --
    -- | Match an ASCII hexadecimal digit 'Char'.
    --
    hexDigit :: Parser String Char
    hexDigit  = satisfy isHexDigit

    --
    -- | Match a letter 'Char'.
    --
    letter :: Parser String Char
    letter  = satisfy isLetter

    --
    -- | Match a mark 'Char'.
    --
    mark :: Parser String Char
    mark  = satisfy isMark

    --
    -- | Match a number 'Char'.
    --
    number :: Parser String Char
    number  = satisfy isNumber

    --
    -- | Match a punctuation symbol 'Char'.
    --
    punctuation :: Parser String Char
    punctuation  = satisfy isPunctuation

    --
    -- | Match a symbol 'Char'.
    --
    symbol :: Parser String Char
    symbol  = satisfy isSymbol

    --
    -- | Match a separator 'Char'.
    --
    separator :: Parser String Char
    separator  = satisfy isSeparator

    --
    -- | Match an ASCII 'Char'
    --
    ascii :: Parser String Char
    ascii  = satisfy isAscii

    --
    -- | Match a Latin-1 'Char'.
    --
    latin1 :: Parser String Char
    latin1  = satisfy isLatin1

    --
    -- | Match an upper case ASCII 'Char'.
    --
    asciiUpper :: Parser String Char
    asciiUpper  = satisfy isAsciiUpper

    --
    -- | Match a lower case ASCII 'Char'.
    --
    asciiLower :: Parser String Char
    asciiLower  = satisfy isAsciiLower

    --
    -- | Match any 'Char'.
    --
    char :: Parser String Char
    char  = satisfy (const True)

    --
    -- | Match the 'Char' c.
    --
    litChar   :: Char -> Parser String Char
    litChar c  = satisfy (==c)
