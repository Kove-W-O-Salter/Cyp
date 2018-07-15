
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.String where
        --
        -- For the: `Parser` and `Stream` data types.
        --
        import Data.Cyp

        --
        -- For the basic `Char` `Parser`s.
        --
        import Text.Cyp.Char

        --
        -- For the `Alternative` class' functions.
        --
        import Control.Applicative

        --
        -- | Match a `String`, of a length >= 0, of control `Char`s.
        --
        matchControls :: Parser String
        matchControls  = many matchControl

        --
        -- | Match a `String`, of a length >= 1, of control `Char`s.
        --
        matchControls1 :: Parser String
        matchControls1  = some matchControl

        --
        -- | Match a `String`, of a length >= 0, of white space `Char`s.
        --
        matchSpaces :: Parser String
        matchSpaces  = many matchSpace

        --
        -- | Match a `String`, of a length >= 1, of white space `Char`s.
        --
        matchSpaces1 :: Parser String
        matchSpaces1  = some matchSpace

        --
        -- | Match a `String`, of a length >= 0, of lower case `Char`s.
        --
        matchLowers :: Parser String
        matchLowers  = many matchLower

        --
        -- | Match a `String`, of a length >= 1, of lower case `Char`s.
        --
        matchLowers1 :: Parser String
        matchLowers1  = some matchLower

        --
        -- | Match a `String`, of a length >= 0, of upper case `Char`s.
        --
        matchUppers :: Parser String
        matchUppers  = many matchUpper

        --
        -- | Match a `String`, of a length >= 1, of upper case `Char`s.
        --
        matchUppers1 :: Parser String
        matchUppers1  = some matchUpper

        --
        -- | Match a `String`, of a length >= 0, of alphabetic `Char`s.
        --
        matchAlphas :: Parser String
        matchAlphas  = many matchAlpha

        --
        -- | Match a `String`, of a length >= 1, of alphabetic `Char`s.
        --
        matchAlphas1 :: Parser String
        matchAlphas1  = some matchAlpha

        --
        -- | Match a `String`, of a length >= 0, of alphabetic `Char`s and digit `Char`s.
        --
        matchAlphaNums :: Parser String
        matchAlphaNums  = some matchAlphaNum

        --
        -- | Match a `String`, of a length >= 1, of alphabetic `Char`s and digit `Char`s.
        --
        matchAlphaNums1 :: Parser String
        matchAlphaNums1  = many matchAlphaNum

        --
        -- | Match a `String`, of a length >= 0, of printable `Char`s.
        --
        matchPrints :: Parser String
        matchPrints  = many matchPrint

        --
        -- | Match a `String`, of a length >= 1, of printable `Char`s.
        --
        matchPrints1 :: Parser String
        matchPrints1  = some matchPrint

        --
        -- | Match a `String`, of a length >= 0, of ASCII digit `Char`s.
        --
        matchDigits :: Parser String
        matchDigits  = many matchDigit

        --
        -- | Match a `String`, of a length >= 1, of ASCII digit `Char`s.
        --
        matchDigits1 :: Parser String
        matchDigits1  = some matchDigit

        --
        -- | Match a `String`, of a length >= 0, of octal digit `Char`s.
        --
        matchOctDigits :: Parser String
        matchOctDigits  = many matchOctDigit

        --
        -- | Match a `String`, of a length >= 1, of octal digit `Char`s.
        --
        matchOctDigits1 :: Parser String
        matchOctDigits1  = some matchOctDigit

        --
        -- | Match a `String`, of a length >= 0, of ASCII hexadecimal digit `Char`s.
        --
        matchHexDigits :: Parser String
        matchHexDigits  = many matchHexDigit

        --
        -- | Match a `String`, of a length >= 1, of ASCII hexadecimal digit `Char`s.
        --
        matchHexDigits1 :: Parser String
        matchHexDigits1  = some matchHexDigit

        --
        -- | Match a `String`, of a length >= 0, of letter `Char`s.
        --
        matchLetters :: Parser String
        matchLetters  = many matchLetter

        --
        -- | Match a `String`, of a length >= 1, of letter `Char`s.
        --
        matchLetters1 :: Parser String
        matchLetters1  = some matchLetter

        --
        -- | Match a `String`, of a length >= 0, of mark `Char`s.
        --
        matchMarks :: Parser String
        matchMarks  = many matchMark

        --
        -- | Match a `String`, of a length >= 1, of mark `Char`s.
        --
        matchMarks1 :: Parser String
        matchMarks1  = some matchMark

        --
        -- | Match a `String`, of a length >= 0, of punctuation symbol `Char`s.
        --
        matchPunctuations :: Parser String
        matchPunctuations  = many matchPunctuation

        --
        -- | Match a `String`, of a length >= 1, of punctuation symbol `Char`s.
        --
        matchPunctuations1 :: Parser String
        matchPunctuations1  = some matchPunctuation

        --
        -- | Match a `String`, of a length >= 0, of symbol `Char`s.
        --
        matchSymbols :: Parser String
        matchSymbols  = many matchSymbol

        --
        -- | Match a `String`, of a length >= 1, of symbol `Char`s.
        --
        matchSymbols1 :: Parser String
        matchSymbols1  = some matchSymbol

        --
        -- | Match a `String`, of a length >= 0, of separator `Char`s.
        --
        matchSeparators :: Parser String
        matchSeparators  = many matchSeparator

        --
        -- | Match a `String`, of a length >= 1, of separator `Char`s.
        --
        matchSeparators1 :: Parser String
        matchSeparators1  = some matchSeparator

        --
        -- | Match a `String`, of a length >= 0, of ASCII `Char`s.
        --
        matchAsciis :: Parser String
        matchAsciis  = many matchAscii

        --
        -- | Match a `String`, of a length >= 1, of ASCII `Char`s.
        --
        matchAsciis1 :: Parser String
        matchAsciis1  = some matchAscii

        --
        -- | Match a `String`, of a length >= 0, of Latin-1 `Char`s.
        --
        matchLatin1s :: Parser String
        matchLatin1s  = many matchLatin1

        --
        -- | Match a `String`, of a length >= 1, of Latin-1 `Char`s.
        --
        matchLatin1s1 :: Parser String
        matchLatin1s1  = some matchLatin1

        --
        -- | Match a `String`, of a length >= 0, of upper case ASCII `Char`s.
        --
        matchAsciiUppers :: Parser String
        matchAsciiUppers  = many matchAsciiUpper

        --
        -- | Match a `String`, of a length >= 1, of upper case ASCII `Char`s.
        --
        matchAsciiUppers1 :: Parser String
        matchAsciiUppers1  = some matchAsciiUpper

        --
        -- | Match a `String`, of a length >= 0, of lower case ASCII `Char`s.
        --
        matchAsciiLowers :: Parser String
        matchAsciiLowers  = many matchAsciiLower

        --
        -- | Match a `String`, of a length >= 1, of lower case ASCII `Char`s.
        --
        matchAsciiLowers1 :: Parser String
        matchAsciiLowers1  = some matchAsciiLower

        --
        -- | Match a `String`, of the length >= 0, of any `Char`s.
        --
        matchAnyChars :: Parser String
        matchAnyChars  = many matchAnyChar

        --
        -- | Match a `String`, of the length >= 1, of any `Char`s.
        --
        matchAnyChars1 :: Parser String
        matchAnyChars1  = some matchAnyChar

        --
        -- | Match the `String` s.
        --
        matchString          :: String -> Parser String
        matchString []        = return []
        matchString (x : xs)  = do y  <- matchChar x
                                   ys <- matchString xs
                                   return (y : ys)
