
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

module Data.Cyp (Parser (Parser), ($>), (|>),
                 (<|),            (/>), (?>),
                 convert) where
        --
        -- | The `Parser` type.
        --
        newtype Parser s a = Parser ([s] -> Maybe (a, [s]))

        --
        -- | Apply a `Parser` to a `Stream`.
        --
        ($>)            :: Parser s a -> [s] -> Maybe (a, [s])
        ($>) (Parser f)  = f

        --
        -- | Run the `Parser` `px` and pass it's result to the `Parser` `fp`.
        --
        (|>)     :: Parser s a -> (a -> Parser s b) -> Parser s b
        px |> fp  = Parser (\stream0 ->
                do (x, stream1) <- px $> stream0
                   fp x $> stream1)

        --
        -- | Run the `Parser` `px` and pass it's result to the `Parser` `fp`.
        --
        (<|)     :: (a -> Parser s b) -> Parser s a -> Parser s b
        fp <| px  = Parser (\stream0 ->
                do (x, stream1) <- px $> stream0
                   fp x $> stream1)

        --
        -- | Run the `Parser` `p1` then the `Parser` `p2`.
        --
        (/>)     :: Parser s a -> Parser s b -> Parser s b
        p1 /> p2  = Parser (\stream0 ->
                do (_, stream1) <- p1 $> stream0
                   p2 $> stream1)

        --
        -- | Run the `Parser` `p1` and, if it succeeds, return it's result, if it fails run the `Parser` `p2`.
        --
        (?>)     :: Parser s a -> Parser s a -> Parser s a
        p1 ?> p2  = Parser (\stream0 ->
                case p1 $> stream0 of
                        Just    (x, stream1) -> Just (x, stream1)
                        Nothing              -> p2 $> stream0)

        --
        -- | Generate a `Parser` that when called will produce the value `x`.
        --
        convert   :: a -> Parser s a
        convert x  = Parser (\stream0 ->
                Just (x, stream0))
