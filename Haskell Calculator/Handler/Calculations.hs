{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handler.Calculations where

import Foundation
import Yesod
import Database.DBConnection
import CalcStructure

getCalculationsR :: Handler TypedContent
getCalculationsR = do
  liftIO (initialiseDB)
  calculations <- liftIO (getRecords)
  selectRep $ do
    provideRep $ defaultLayout $ do
      setTitle "Calculations"
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
            <li><a href=@{AddR 12 3}>Addition</a>
            <li><a href=@{SubtractR 5 10}>Subtraction</a>
            <li><a href=@{MultiplyR 7 8}>Multiplication</a>
            <li><a href=@{DivideR 20 5}>Division</a>
      $if null calculations
        <p> No calculations have been made! <p>
      $else
        <p>Every calculation ever made.<p>
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
