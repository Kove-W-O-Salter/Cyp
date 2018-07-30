
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Char (pred,     control,    space,
                      lower,    upper,      alpha,
                      alphaNum, print,      digit,
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
    -- For 'Char' predicates.
    --
    import Data.Char

    --
    -- | Match a 'Char' that satisfies the predicate 'p'.
    --
    pred   :: (Char -> Bool) -> Parser String Char
    pred p  = P (\stream0 ->
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
    control  = pred isControl

    --
    -- | Match a whitespace 'Char'.
    --
    space :: Parser String Char
    space  = pred isSpace

    --
    -- | Match a lower case 'Char'.
    --
    lower :: Parser String Char
    lower  = pred isLower

    --
    -- | Match an upper case 'Char'.
    --
    upper :: Parser String Char
    upper  = pred isUpper

    --
    -- | Match an alphabetic 'Char'.
    --
    alpha :: Parser String Char
    alpha  = pred isAlpha

    --
    -- | Match an alphabetic 'Char' or a digit 'Char'.
    --
    alphaNum :: Parser String Char
    alphaNum  = pred isAlphaNum

    --
    -- | Match a printable 'Char'.
    --
    print :: Parser String Char
    print  = pred isPrint

    --
    -- | Match an ASCII digit 'Char'.
    --
    digit :: Parser String Char
    digit  = pred isDigit

    --
    -- | Match an ASCII octal digit 'Char'.
    --
    octDigit :: Parser String Char
    octDigit  = pred isOctDigit

    --
    -- | Match an ASCII hexadecimal digit 'Char'.
    --
    hexDigit :: Parser String Char
    hexDigit  = pred isHexDigit

    --
    -- | Match a letter 'Char'.
    --
    letter :: Parser String Char
    letter  = pred isLetter

    --
    -- | Match a mark 'Char'.
    --
    mark :: Parser String Char
    mark  = pred isMark

    --
    -- | Match a number 'Char'.
    --
    number :: Parser String Char
    number  = pred isNumber

    --
    -- | Match a punctuation symbol 'Char'.
    --
    punctuation :: Parser String Char
    punctuation  = pred isPunctuation

    --
    -- | Match a symbol 'Char'.
    --
    symbol :: Parser String Char
    symbol  = pred isSymbol

    --
    -- | Match a separator 'Char'.
    --
    separator :: Parser String Char
    separator  = pred isSeparator

    --
    -- | Match an ASCII 'Char'
    --
    ascii :: Parser String Char
    ascii  = pred isAscii

    --
    -- | Match a Latin-1 'Char'.
    --
    latin1 :: Parser String Char
    latin1  = pred isLatin1

    --
    -- | Match an upper case ASCII 'Char'.
    --
    asciiUpper :: Parser String Char
    asciiUpper  = pred isAsciiUpper

    --
    -- | Match a lower case ASCII 'Char'.
    --
    asciiLower :: Parser String Char
    asciiLower  = pred isAsciiLower

    --
    -- | Match any 'Char'.
    --
    char :: Parser String Char
    char  = pred (const True)

    --
    -- | Match the 'Char' c.
    --
    litChar   :: Char -> Parser String Char
    litChar c  = pred (==c)
