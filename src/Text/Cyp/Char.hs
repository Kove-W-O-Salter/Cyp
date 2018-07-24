
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Char (matchPred,     matchControl,    matchSpace,
                      matchLower,    matchUpper,      matchAlpha,
                      matchAlphaNum, matchPrint,      matchDigit,
                      matchOctDigit, matchHexDigit,   matchLetter,
                      matchMark,     matchNumber,     matchPunctuation,
                      matchSymbol,   matchSeparator,  matchAscii,
                      matchLatin1,   matchAsciiUpper, matchAsciiLower,
                      matchChar,     matchLitChar) where
        --
        -- For foundation
        --
        import Data.Cyp

        --
        -- For `Char` predicates.
        --
        import Data.Char

        --
        -- | Match a `Char` that satisfies the predicate `p`.
        --
        matchPred   :: (Char -> Bool) -> Parser Char Char
        matchPred p  = Parser (\stream0 ->
                case stream0 of
                        []            -> Nothing
                        (x : stream1) ->
                                if p x
                                        then Just (x, stream1)
                                        else Nothing)

        --
        -- | Match a control `Char`.
        --
        matchControl :: Parser Char Char
        matchControl  = matchPred isControl

        --
        -- | Match a whitespace `Char`.
        --
        matchSpace :: Parser Char Char
        matchSpace  = matchPred isSpace

        --
        -- | Match a lower case `Char`.
        --
        matchLower :: Parser Char Char
        matchLower  = matchPred isLower

        --
        -- | Match an upper case `Char`.
        --
        matchUpper :: Parser Char Char
        matchUpper  = matchPred isUpper

        --
        -- | Match an alphabetic `Char`.
        --
        matchAlpha :: Parser Char Char
        matchAlpha  = matchPred isAlpha

        --
        -- | Match an alphabetic `Char` or a digit `Char`.
        --
        matchAlphaNum :: Parser Char Char
        matchAlphaNum  = matchPred isAlphaNum

        --
        -- | Match a printable `Char`.
        --
        matchPrint :: Parser Char Char
        matchPrint  = matchPred isPrint

        --
        -- | Match an ASCII digit `Char`.
        --
        matchDigit :: Parser Char Char
        matchDigit  = matchPred isDigit

        --
        -- | Match an ASCII octal digit `Char`.
        --
        matchOctDigit :: Parser Char Char
        matchOctDigit  = matchPred isOctDigit

        --
        -- | Match an ASCII hexadecimal digit `Char`.
        --
        matchHexDigit :: Parser Char Char
        matchHexDigit  = matchPred isHexDigit

        --
        -- | Match a letter `Char`.
        --
        matchLetter :: Parser Char Char
        matchLetter  = matchPred isLetter

        --
        -- | Match a mark `Char`.
        --
        matchMark :: Parser Char Char
        matchMark  = matchPred isMark

        --
        -- | Match a number `Char`.
        --
        matchNumber :: Parser Char Char
        matchNumber  = matchPred isNumber

        --
        -- | Match a punctuation symbol `Char`.
        --
        matchPunctuation :: Parser Char Char
        matchPunctuation  = matchPred isPunctuation

        --
        -- | Match a symbol `Char`.
        --
        matchSymbol :: Parser Char Char
        matchSymbol  = matchPred isSymbol

        --
        -- | Match a separator `Char`.
        --
        matchSeparator :: Parser Char Char
        matchSeparator  = matchPred isSeparator

        --
        -- | Match an ASCII `Char`
        --
        matchAscii :: Parser Char Char
        matchAscii  = matchPred isAscii

        --
        -- | Match a Latin-1 `Char`.
        --
        matchLatin1 :: Parser Char Char
        matchLatin1  = matchPred isLatin1

        --
        -- | Match an upper case ASCII `Char`.
        --
        matchAsciiUpper :: Parser Char Char
        matchAsciiUpper  = matchPred isAsciiUpper

        --
        -- | Match a lower case ASCII `Char`.
        --
        matchAsciiLower :: Parser Char Char
        matchAsciiLower  = matchPred isAsciiLower

        --
        -- | Match any `Char`.
        --
        matchChar :: Parser Char Char
        matchChar  = matchPred (const True)

        --
        -- | Match the `Char` c.
        --
        matchLitChar   :: Char -> Parser Char Char
        matchLitChar c  = matchPred (==c)
