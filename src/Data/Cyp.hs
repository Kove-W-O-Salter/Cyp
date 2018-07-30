
--
-- | Copyright (c), Kove W. Ochre-Salter, 2018.
--   This Haskell source-file is freely distributable under terms of the MIT License.
--   A copy of said License is provided in the root directory of this project (LICENSE).
--

-- OLD -- module Data.Cyp (Parser (Parser), ($>), (|>),
-- OLD --                  (<|),            (/>), (?>),
-- OLD --                  convert) where
-- OLD --         --
-- OLD --         -- | The `Parser` type.
-- OLD --         --
-- OLD --         newtype Parser s a = Parser ([s] -> Maybe (a, [s]))
-- OLD -- 
-- OLD --         --
-- OLD --         -- | Apply a `Parser` to a `Stream`.
-- OLD --         --
-- OLD --         ($>)            :: Parser s a -> [s] -> Maybe (a, [s])
-- OLD --         ($>) (Parser f)  = f
-- OLD -- 
-- OLD --         --
-- OLD --         -- | Run the `Parser` `px` and pass it's result to the `Parser` `fp`.
-- OLD --         --
-- OLD --         (|>)     :: Parser s a -> (a -> Parser s b) -> Parser s b
-- OLD --         px |> fp  = Parser (\stream0 ->
-- OLD --                 do (x, stream1) <- px $> stream0
-- OLD --                    fp x $> stream1)
-- OLD -- 
-- OLD --         --
-- OLD --         -- | Run the `Parser` `px` and pass it's result to the `Parser` `fp`.
-- OLD --         --
-- OLD --         (<|)     :: (a -> Parser s b) -> Parser s a -> Parser s b
-- OLD --         fp <| px  = Parser (\stream0 ->
-- OLD --                 do (x, stream1) <- px $> stream0
-- OLD --                    fp x $> stream1)
-- OLD -- 
-- OLD --         --
-- OLD --         -- | Run the `Parser` `p1` then the `Parser` `p2`.
-- OLD --         --
-- OLD --         (/>)     :: Parser s a -> Parser s b -> Parser s b
-- OLD --         p1 /> p2  = Parser (\stream0 ->
-- OLD --                 do (_, stream1) <- p1 $> stream0
-- OLD --                    p2 $> stream1)
-- OLD -- 
-- OLD --         --
-- OLD --         -- | Run the `Parser` `p1` and, if it succeeds, return it's result, if it fails run the `Parser` `p2`.
-- OLD --         --
-- OLD --         (?>)     :: Parser s a -> Parser s a -> Parser s a
-- OLD --         p1 ?> p2  = Parser (\stream0 ->
-- OLD --                 case p1 $> stream0 of
-- OLD --                         Just    (x, stream1) -> Just (x, stream1)
-- OLD --                         Nothing              -> p2 $> stream0)
-- OLD -- 
-- OLD --         --
-- OLD --         -- | Generate a `Parser` that when called will produce the value `x`.
-- OLD --         --
-- OLD --         convert   :: a -> Parser s a
-- OLD --         convert x  = Parser (\stream0 ->
-- OLD --                 Just (x, stream0))

module Data.Cyp  where
    --
    -- For 'Alternative'.
    --
    import Control.Applicative
    
    -- |
    -- The parser 'AGDT', which is a function that takes an initial input
    -- stream and returns, either, 'Just' an 'a' paired with a 's' or 'Nothing'.
    --
    newtype Parser s a = P (s -> Maybe (a, s))
    
    --
    -- For do-notation integration, DRY and usability.
    --
    instance Monad (Parser s) where
        --
        -- (>>=) :: Parser s a -> (a -> Parser s b) -> Parser s b
        --
        px >>= pf = P (\stream0 ->
          case apply px stream0 of
            Nothing            -> Nothing
            Just  (x, stream1) -> apply (pf x) stream1)
    
    --
    -- For do-notation integration, DRY and usability.
    --
    instance Applicative (Parser s) where
        --
        -- pure :: a -> Parser s a
        --
        pure x = P (\stream0 ->
          Just (x, stream0))
        
        --
        -- (<*>) :: Parser s (a -> b) -> Parser s a -> Parser s b
        --
        pf <*> px = do f <- pf
                       x <- px
                       return $ f x
    
    --
    -- For do-notation integration, DRY and usability.
    --
    instance Functor (Parser s) where
        --
        -- fmap :: (a -> b) -> Parser s a -> Parser s b
        --
        fmap f px = (pure f) <*> px
    
    instance Alternative (Parser s) where
        --
        -- empty :: Parser s a
        --
        empty = P (\stream0 ->
          Nothing)
        
        --
        -- (<|>) :: Parser s a -> Parser s a -> Parser s a
        --
        p1 <|> p2 = P (\stream0 ->
          case apply p1 stream0 of
            Just    r -> Just r
            Nothing   -> apply p2 stream0)
        
        --
        -- some :: Parser s a -> Parser s [a]
        --
        some v = (:) <$> v <*> many v
        
        --
        -- many :: Parser s a -> Parser s [a]
        --
        many v = some v <|> pure []
    
    -- |
    -- Remove a 'Parser's dummy constructor, evaluating to the 'Parser' its self.
    --
    apply       :: Parser s a -> s -> Maybe (a, s)
    apply (P f)  = f
