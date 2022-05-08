{-# LANGUAGE OverloadedStrings #-}

module Database.DBConnection where

import Database.SQLite.Simple
import CalcStructure

dbPath :: String
dbPath = "Database/calculations.db"

insertRecord :: Calculation -> IO ()
insertRecord c = do
  conn <- open dbPath
  execute_ conn "CREATE TABLE IF NOT EXISTS calculations (firstOp INTEGER, operator TEXT, secondOp INTEGER, result INTEGER)"
--  rowId <- lastInsertRowId conn
  execute conn "INSERT INTO calculations (firstOp, operator, secondOp, result) VALUES (?,?,?,?)" (c :: Calculation)
  close conn

getRecords :: IO [Calculation]
getRecords = do
  conn <- open dbPath
  cs <- query_ conn "SELECT * from calculations" :: IO [Calculation]
  close conn
  return cs

getAllOperator :: String -> IO [Calculation]
getAllOperator op = do
  conn <- open dbPath
  cs <- query conn "SELECT firstOp, operator, secondOp, result from calculations WHERE operator = ?" (Only(op :: String)) :: IO [Calculation]
  close conn
  return cs

initialiseDB :: IO ()
initialiseDB  = do
  conn <- open dbPath
  execute_ conn "CREATE TABLE IF NOT EXISTS calculations (firstOp INTEGER, operator TEXT, secondOp INTEGER, result INTEGER)"
  close conn

deleteDB :: IO ()
deleteDB = do
  conn <- open dbPath
  execute_ conn "DROP TABLE calculations"
  close conn

getRecord :: Int -> IO [Calculation]
getRecord i = do
  conn <- open dbPath
  c <- query conn "SELECT firstOp, operator, secondOp, result from calculations WHERE operator = ?" (Only("+" :: String)) :: IO [Calculation]
  close conn
  return c
