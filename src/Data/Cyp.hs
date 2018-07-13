
--
-- Copyright (c), Kove W. Ochre-Salter, 2018.
-- This Haskell source-file is freely distributable under terms of the MIT License.
-- A copy of said License is provided in the root directory of this project (LICENSE).
--

module Data.Cyp where
        --
        -- The type of `Stream` that this Cyp will accept (A `String`).
        --
        type Stream = String

        --
        -- The type of a `Parser` that is a function that takes a `Stream` and returns, `Maybe`, an `a` paired a `String.
        --
        newtype Parser a = Parser (Stream -> Maybe (a, Stream))

        --
        -- Making the `Parser` type a `Monad` so that `Parser`s can be chained together.
        --
        instance Monad Parser where
                --
                -- (>>=) :: Parser a -> (a -> Parser b) -> Parser b
                --
                px >>= fp = Parser (\stream0 ->
                        case apply px stream0 of
                                Nothing              -> Nothing
                                Just   (x, stream1)  ->
                                        apply (fp x) stream1)

        --
        -- Making the `Parser` type a `Functor` so that it can be made into a `Monad`.
        --
        instance Functor Parser where
                --
                -- fmap :: (a -> b) -> Parser a -> Parser b
                --
                fmap f px = px >>= \x -> return $ f x

        --
        -- Making the `Parser` type an `Applicative Functor` so that it can be made into a `Monad`.
        --
        instance Applicative Parser where
                --
                -- pure :: a -> Parser a
                --
                pure x = Parser (\stream0 ->
                        Just (x, stream0))

                --
                -- (<*>) :: Parser (a -> b) -> Parser a -> Parser b
                --
                pf <*> px = pf >>= \f ->
                        px >>= \x ->
                                return $ f x

        --
        -- Remove the `Parser` p's dummy constructor.
        --
        apply            :: Parser a -> Stream -> Maybe (a, Stream)
        apply (Parser f)  = f
