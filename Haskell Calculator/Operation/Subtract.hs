{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handler.Subtract where

import Foundation
import Yesod.Core
import CalcStructure
import Database.DBConnection (initialiseDB,insertRecord, getAllOperator)

getSubtractR :: Int -> Int -> Handler TypedContent
getSubtractR x y = do
  liftIO (initialiseDB)
  liftIO (insertRecord c)
  selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Subtract"
        addStylesheetRemote "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
        addStylesheetRemote "http://fonts.googleapis.com/css?family=Strait"
        addStylesheet $ StaticR layoutCSS_css
        [whamlet|
        <nav class="navbar navbar-inverse">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="#">Haskell Web Calculator</a>
            <ul class="nav navbar-nav">
              <li><a href=@{HomeR}>Home</a>
              <li><a href=@{AddR 10 2}>Addition</a>
              <li class="active"><a href="#">Subtraction</a>
              <li><a href=@{MultiplyR 7 8}>Multiplication</a>
              <li><a href=@{DivideR 20 5}>Division</a>
        <p> The result of the calculation is: #{x} - #{y} = #{z}
        <br>
        <p><a href=@{AllSubtractR}> See every Subtraction calculation</a>
        <p><a href=@{CalculationsR}> See every Calculation</a>|]
    provideJson $ c
  where
    z = x - y
    c = (Calculation x "-" y z)

getAllSubtractR :: Handler TypedContent
getAllSubtractR = do
  calculations <- liftIO (getAllOperator "-")
  selectRep $ do
    provideRep $ defaultLayout $ do
      setTitle "All Subtraction calculations"
      addStylesheetRemote "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
      addStylesheetRemote "http://fonts.googleapis.com/css?family=Strait"
      addStylesheet $ StaticR layoutCSS_css
      [whamlet|
      <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="#">Haskell Web Calculator</a>
          <ul class="nav navbar-nav">
            <li class="active"><a href=@{HomeR}>Home</a>
            <li><a href=@{AddR 10 2}>Addition</a>
            <li><a href="#">Subtraction</a>
            <li><a href=@{MultiplyR 7 8}>Multiplication</a>
            <li><a href=@{DivideR 20 5}>Division</a>
      $if null calculations
        <p> No subtractions have been made!
      $else
        <p> Every Subtraction calculation ever made.
        <table class="table table-hover">
          <thead>
            <tr>
              <th>First Operand</th>
              <th>Operator</th>
              <th>Second Operand</th>
              <th>Result</th>
          <tbody>
            $forall c <- calculations
              <tr>
                <td>#{firstOp c}
                <td>#{operator c}
                <td>#{secondOp c}
                <td>#{result c}
      |]
    provideJson $ calculations
