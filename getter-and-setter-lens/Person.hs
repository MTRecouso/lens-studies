{-# LANGUAGE TemplateHaskell #-}
module Person where

import Control.Lens

data Address = Address {
    _street :: String,
    _number :: String,
    _complement :: String
} deriving Show

data Person = Person {
    _name :: String,
    _address :: Address,
    _phone :: String,
    _height :: Float,
    _weight :: Float
} deriving Show

-- Sample person to ease testing
mateus :: Person
mateus = Person "Mateus" (Address "Rua Dom Pedro" "77" "ap 14") "9999999" 170.2 60.0

makeLenses ''Address
makeLenses ''Person

--Some basic getter and setter functions for Person

getName :: Person -> String
getName person = person ^. name

setName :: Person -> String -> Person
setName person newName = person & name .~ newName

addWeight :: Person -> Float -> Person
addWeight person additionalWeight = person & weight %~ (+ additionalWeight)

decreaseWeight :: Person -> Float -> Person
decreaseWeight person weightDiff = person & weight %~ (\x -> x - weightDiff)

getWeight :: Person -> Float
getWeight person = person ^. weight

getStreet :: Person -> String
getStreet person  = person ^. address.street  

setStreet :: Person -> String -> Person
setStreet person newStreet = person & address.street .~ newStreet
