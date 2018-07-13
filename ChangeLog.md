# Revision history for Cyp

## 0.1.0.0  -- 2018-June-13th
### First development version. Released on an unsuspecting world.

## 0.1.0.1  -- 2018-June-13th
### Seccond development version.
What's new:
* Add `Text.Cyp.parseCyp`
* Add `Text.Cyp.(>>!)`
* Add `Text.Cyp.manyOf`
* Add `Text.Cyp.someOf`

## 0.1.0.2  -- 2018-June-13th
### Third development version.
What's new:
* Add `Text.Cyp.Char`
* Add `Text.Cyp.Char.matchPred`
* Add `Text.Cyp.Char.matchControl`
* Add `Text.Cyp.Char.matchSpace`
* Add `Text.Cyp.Char.matchLower`
* Add `Text.Cyp.Char.matchUpper`
* Add `Text.Cyp.Char.matchAlpha`
* Add `Text.Cyp.Char.matchAlphaNum`
* Add `Text.Cyp.Char.matchPrint`
* Add `Text.Cyp.Char.matchDigit`
* Add `Text.Cyp.Char.matchOctDigit`
* Add `Text.Cyp.Char.matchHexDigit`
* Add `Text.Cyp.Char.matchLetter`
* Add `Text.Cyp.Char.matchMark`
* Add `Text.Cyp.Char.matchNumber`
* Add `Text.Cyp.Char.matchPunctuation`
* Add `Text.Cyp.Char.matchSymbol`
* Add `Text.Cyp.Char.matchSeparator`
* Add `Text.Cyp.Char.matchAscii`
* Add `Text.Cyp.Char.matchLatin1`
* Add `Text.Cyp.Char.matchAsciiUpper`
* Add `Text.Cyp.Char.matchAsciiLower`
* Add `Text.Cyp.Char.matchChar`

## 0.1.0.3  -- 2018-June-13th
### Fourth development version.
What's new:
* Instance `Data.Cyp.Parser` of `Control.Applicative.Alternative`
* Modify `Text.Cyp.(>>!)` to be the same as `Data.Cyp.(<|>)`
* Modify `Text.Cyp.manyOf` to be the same as `Data.Cyp.many`
* Modify `Text.Cyp.someOf` to be the same as `Data.Cyp.some`

## 0.1.0.4  -- 2018-June-13th
### Fift development version.
What's new:
* Add `Text.Cyp.String`
* Add `Text.Cyp.String.matchString`
* Add `Text.Cyp.String.matchControls`
* Add `Text.Cyp.String.matchControls1`
* Add `Text.Cyp.String.matchSpaces`
* Add `Text.Cyp.String.matchSpaces1`
* Add `Text.Cyp.String.matchLowers`
* Add `Text.Cyp.String.matchLowers1`
* Add `Text.Cyp.String.matchUppers`
* Add `Text.Cyp.String.matchUppers1`
* Add `Text.Cyp.String.matchAlphas`
* Add `Text.Cyp.String.matchAlphas1`
* Add `Text.Cyp.String.matchAlphaNums`
* Add `Text.Cyp.String.matchAlphaNums1`
* Add `Text.Cyp.String.matchPrints`
* Add `Text.Cyp.String.matchPrints1`
* Add `Text.Cyp.String.matchDigits`
* Add `Text.Cyp.String.matchDigits1`
* Add `Text.Cyp.String.matchOctDigits`
* Add `Text.Cyp.String.matchOctDigits1`
* Add `Text.Cyp.String.matchHexDigits`
* Add `Text.Cyp.String.matchHexDigits1`
* Add `Text.Cyp.String.matchLetters`
* Add `Text.Cyp.String.matchLetters1`
* Add `Text.Cyp.String.matchMarks`
* Add `Text.Cyp.String.matchMarks1`
* Add `Text.Cyp.String.matchPunctuations`
* Add `Text.Cyp.String.matchPunctuations1`
* Add `Text.Cyp.String.matchSymbols`
* Add `Text.Cyp.String.matchSymbols1`
* Add `Text.Cyp.String.matchSeparators`
* Add `Text.Cyp.String.matchSeparators1`
* Add `Text.Cyp.String.matchAsciis`
* Add `Text.Cyp.String.matchAsciis1`
* Add `Text.Cyp.String.matchLatin1s`
* Add `Text.Cyp.String.matchLatin1s1`
* Add `Text.Cyp.String.matchAsciiUppers`
* Add `Text.Cyp.String.matchAsciiUppers1`
* Add `Text.Cyp.String.matchAsciiLowers`
* Add `Text.Cyp.String.matchAsciiLowers1`

## 0.1.0.5  -- 2018-June-14th
### Sixth development version.
What's new:
* Add `Test.Cyp.Int`
* Add `Text.Cyp.Int.matchInt`
* Add `Text.Cyp.Int.matchInt8`
* Add `Text.Cyp.Int.matchInt16`
* Add `Text.Cyp.Int.matchInt32`
* Add `Text.Cyp.Int.matchInt64`
* Add `Text.Cyp.Int.matchLitIntegral`
* Add `Text.Cyp.Int.matchLitInt`
* Add `Text.Cyp.Int.matchLitInt8`
* Add `Text.Cyp.Int.matchLitInt16`
* Add `Text.Cyp.Int.matchLitInt32`
* Add `Text.Cyp.Int.matchLitInt64`
