{-# LANGUAGE DeriveGeneric #-}

module CalcStructure where

import Yesod.Core
import GHC.Generics
import Database.SQLite.Simple
import Text.Blaze

data Calculation = Calculation {
  firstOp :: Int,
  operator :: String,
  secondOp :: Int,
  result :: Int
} deriving (Generic, Show)

instance ToJSON Calculation
instance FromJSON Calculation

instance FromRow Calculation where
  fromRow = Calculation <$> field <*> field <*> field <*> field

instance ToRow Calculation where
  toRow (Calculation firstOp operator secondOp result) = toRow (firstOp, operator, secondOp, result)

instance ToMarkup Calculation where
  toMarkup = toMarkup . show
