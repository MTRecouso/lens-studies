module Main where

import Person

--Playing a bit with the person getters and setters

main :: IO ()
main = do
    print $ "Name: " ++ getName mateus
    tiago <- return $ setName mateus "Tiago"
    print $ "Name: " ++ getName tiago
    print $ "Street: " ++ getStreet tiago
    print $ "Weight: " ++ (show.getWeight) tiago
    tiagoWithNewStreet <- return $ setStreet tiago "Rua Tatui"
    print $ "Street: " ++ getStreet tiagoWithNewStreet
    tiagoWithAddedWeight <- return $ addWeight tiago 3.0
    print $ "Weight: " ++ (show.getWeight) tiagoWithAddedWeight