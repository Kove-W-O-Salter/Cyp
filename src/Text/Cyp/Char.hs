
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Text.Cyp.Char where
        --
        -- For the: `Parser` and `Stream` types.
        --
        import Data.Cyp

        --
        -- For `Char` predicates.
        --
        import Data.Char

        --
        -- | Match a `Char` in the input `Stream` that satisfies, the predicate, p.
        --
        matchPred   :: (Char -> Bool) -> Parser Char
        matchPred p  = Parser (\stream0 ->
                case stream0 of
                        []       -> Nothing
                        (x : xs) ->
                                if p x
                                        then Just (x, xs)
                                        else Nothing)

        --
        -- | Match a control `Char`.
        --
        matchControl :: Parser Char
        matchControl  = matchPred isControl

        --
        -- | Match a whitespace `Char`.
        --
        matchSpace :: Parser Char
        matchSpace  = matchPred isSpace

        --
        -- | Match a lower case `Char`.
        --
        matchLower :: Parser Char
        matchLower  = matchPred isLower

        --
        -- | Match an upper case `Char`.
        --
        matchUpper :: Parser Char
        matchUpper  = matchPred isUpper

        --
        -- | Match an alphabetic `Char`.
        --
        matchAlpha :: Parser Char
        matchAlpha  = matchPred isAlpha

        --
        -- | Match an alphabetic `Char` or a digit `Char`.
        --
        matchAlphaNum :: Parser Char
        matchAlphaNum  = matchPred isAlphaNum

        --
        -- | Match a printable `Char`.
        --
        matchPrint :: Parser Char
        matchPrint  = matchPred isPrint

        --
        -- | Match an ASCII digit `Char`.
        --
        matchDigit :: Parser Char
        matchDigit  = matchPred isDigit

        --
        -- | Match an ASCII octal digit `Char`.
        --
        matchOctDigit :: Parser Char
        matchOctDigit  = matchPred isOctDigit

        --
        -- | Match an ASCII hexadecimal digit `Char`.
        --
        matchHexDigit :: Parser Char
        matchHexDigit  = matchPred isHexDigit

        --
        -- | Match a letter `Char`.
        --
        matchLetter :: Parser Char
        matchLetter  = matchPred isLetter

        --
        -- | Match a mark `Char`.
        --
        matchMark :: Parser Char
        matchMark  = matchPred isMark

        --
        -- | Match a number `Char`.
        --
        matchNumber :: Parser Char
        matchNumber  = matchPred isNumber

        --
        -- | Match a punctuation symbol `Char`.
        --
        matchPunctuation :: Parser Char
        matchPunctuation  = matchPred isPunctuation

        --
        -- | Match a symbol `Char`.
        --
        matchSymbol :: Parser Char
        matchSymbol  = matchPred isSymbol

        --
        -- | Match a separator `Char`.
        --
        matchSeparator :: Parser Char
        matchSeparator  = matchPred isSeparator

        --
        -- | Match an ASCII `Char`
        --
        matchAscii :: Parser Char
        matchAscii  = matchPred isAscii

        --
        -- | Match a Latin-1 `Char`.
        --
        matchLatin1 :: Parser Char
        matchLatin1  = matchPred isLatin1

        --
        -- | Match an upper case ASCII `Char`.
        --
        matchAsciiUpper :: Parser Char
        matchAsciiUpper  = matchPred isAsciiUpper

        --
        -- | Match a lower case ASCII `Char`.
        --
        matchAsciiLower :: Parser Char
        matchAsciiLower  = matchPred isAsciiLower

        --
        -- | Match any `Char`.
        --
        matchAnyChar :: Parser Char
        matchAnyChar  = matchPred (\_ -> True)

        --
        -- | Match the `Char` c.
        --
        matchLitChar   :: Char -> Parser Char
        matchLitChar c  = matchPred (==c)
