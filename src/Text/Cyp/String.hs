
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.String (controls,     controls1,     spaces, 
                        spaces1,      lowers,        lowers1, 
                        uppers,       uppers1,       alphas, 
                        alphas1,      alphaNums,     alphaNums1, 
                        prints,       prints1,       digits, 
                        digits1,      octDigits,     octDigits1,
                        hexDigits,    hexDigits1,    letters,
                        letters1,     marks,         marks1,
                        punctuations, punctuations1, symbols,
                        symbols1,     separators,    separators1,
                        asciis,       asciis1,       latin1s,
                        latin1s1,     asciiUppers,   asciiUppers1,
                        asciiLowers,  asciiLowers1,  chars,
                        chars1,       litString) where
    --
    -- For the: 'Parser' and 'Stream' data types.
    --
    import Data.Cyp

    --
    -- For the basic 'Char' 'Parser's.
    --
    import Text.Cyp.Char

    --
    -- | Match a 'String', of a length >= 0, of control 'Char's.
    --
    controls :: Parser String String
    controls  = many control

    --
    -- | Match a 'String', of a length >= 1, of control 'Char's.
    --
    controls1 :: Parser String String
    controls1  = some control

    --
    -- | Match a 'String', of a length >= 0, of white space 'Char's.
    --
    spaces :: Parser String String
    spaces  = many space

    --
    -- | Match a 'String', of a length >= 1, of white space 'Char's.
    --
    spaces1 :: Parser String String
    spaces1  = some space

    --
    -- | Match a 'String', of a length >= 0, of lower case 'Char's.
    --
    lowers :: Parser String String
    lowers  = many lower

    --
    -- | Match a 'String', of a length >= 1, of lower case 'Char's.
    --
    lowers1 :: Parser String String
    lowers1  = some lower

    --
    -- | Match a 'String', of a length >= 0, of upper case 'Char's.
    --
    uppers :: Parser String String
    uppers  = many upper

    --
    -- | Match a 'String', of a length >= 1, of upper case 'Char's.
    --
    uppers1 :: Parser String String
    uppers1  = some upper

    --
    -- | Match a 'String', of a length >= 0, of alphabetic 'Char's.
    --
    alphas :: Parser String String
    alphas  = many alpha

    --
    -- | Match a 'String', of a length >= 1, of alphabetic 'Char's.
    --
    alphas1 :: Parser String String
    alphas1  = some alpha

    --
    -- | Match a 'String', of a length >= 0, of alphabetic 'Char's and digit 'Char's.
    --
    alphaNums :: Parser String String
    alphaNums  = some alphaNum

    --
    -- | Match a 'String', of a length >= 1, of alphabetic 'Char's and digit 'Char's.
    --
    alphaNums1 :: Parser String String
    alphaNums1  = many alphaNum

    --
    -- | Match a 'String', of a length >= 0, of printable 'Char's.
    --
    prints :: Parser String String
    prints  = many print

    --
    -- | Match a 'String', of a length >= 1, of printable 'Char's.
    --
    prints1 :: Parser String String
    prints1  = some print

    --
    -- | Match a 'String', of a length >= 0, of ASCII digit 'Char's.
    --
    digits :: Parser String String
    digits  = many digit

    --
    -- | Match a 'String', of a length >= 1, of ASCII digit 'Char's.
    --
    digits1 :: Parser String String
    digits1  = some digit

    --
    -- | Match a 'String', of a length >= 0, of octal digit 'Char's.
    --
    octDigits :: Parser String String
    octDigits  = many octDigit

    --
    -- | Match a 'String', of a length >= 1, of octal digit 'Char's.
    --
    octDigits1 :: Parser String String
    octDigits1  = some octDigit

    --
    -- | Match a 'String', of a length >= 0, of ASCII hexadecimal digit 'Char's.
    --
    hexDigits :: Parser String String
    hexDigits  = many hexDigit

    --
    -- | Match a 'String', of a length >= 1, of ASCII hexadecimal digit 'Char's.
    --
    hexDigits1 :: Parser String String
    hexDigits1  = some hexDigit

    --
    -- | Match a 'String', of a length >= 0, of letter 'Char's.
    --
    letters :: Parser String String
    letters  = many letter

    --
    -- | Match a 'String', of a length >= 1, of letter 'Char's.
    --
    letters1 :: Parser String String
    letters1  = some letter

    --
    -- | Match a 'String', of a length >= 0, of mark 'Char's.
    --
    marks :: Parser String String
    marks  = many mark

    --
    -- | Match a 'String', of a length >= 1, of mark 'Char's.
    --
    marks1 :: Parser String String
    marks1  = some mark

    --
    -- | Match a 'String', of a length >= 0, of punctuation symbol 'Char's.
    --
    punctuations :: Parser String String
    punctuations  = many punctuation

    --
    -- | Match a 'String', of a length >= 1, of punctuation symbol 'Char's.
    --
    punctuations1 :: Parser String String
    punctuations1  = some punctuation

    --
    -- | Match a 'String', of a length >= 0, of symbol 'Char's.
    --
    symbols :: Parser String String
    symbols  = many symbol

    --
    -- | Match a 'String', of a length >= 1, of symbol 'Char's.
    --
    symbols1 :: Parser String String
    symbols1  = some symbol

    --
    -- | Match a 'String', of a length >= 0, of separator 'Char's.
    --
    separators :: Parser String String
    separators  = many separator

    --
    -- | Match a 'String', of a length >= 1, of separator 'Char's.
    --
    separators1 :: Parser String String
    separators1  = some separator

    --
    -- | Match a 'String', of a length >= 0, of ASCII 'Char's.
    --
    asciis :: Parser String String
    asciis  = many ascii

    --
    -- | Match a 'String', of a length >= 1, of ASCII 'Char's.
    --
    asciis1 :: Parser String String
    asciis1  = some ascii

    --
    -- | Match a 'String', of a length >= 0, of Latin-1 'Char's.
    --
    latin1s :: Parser String String
    latin1s  = many latin1

    --
    -- | Match a 'String', of a length >= 1, of Latin-1 'Char's.
    --
    latin1s1 :: Parser String String
    latin1s1  = some latin1

    --
    -- | Match a 'String', of a length >= 0, of upper case ASCII 'Char's.
    --
    asciiUppers :: Parser String String
    asciiUppers  = many asciiUpper

    --
    -- | Match a 'String', of a length >= 1, of upper case ASCII 'Char's.
    --
    asciiUppers1 :: Parser String String
    asciiUppers1  = some asciiUpper

    --
    -- | Match a 'String', of a length >= 0, of lower case ASCII 'Char's.
    --
    asciiLowers :: Parser String String
    asciiLowers  = many asciiLower

    --
    -- | Match a 'String', of a length >= 1, of lower case ASCII 'Char's.
    --
    asciiLowers1 :: Parser String String
    asciiLowers1  = some asciiLower

    --
    -- | Match a 'String', of the length >= 0, of any 'Char's.
    --
    chars :: Parser String String
    chars  = many char

    --
    -- | Match a 'String', of the length >= 1, of any 'Char's.
    --
    chars1 :: Parser String String
    chars1  = some char

    --
    -- | Match the 'String' s.
    --
    litString          :: String -> Parser String String
    litString []        = return []
    litString (x : xs)  = do y  <- litChar x
                             ys <- litString xs
                             return (y : ys)
