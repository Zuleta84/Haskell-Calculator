{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE ViewPatterns         #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}
module App where

import Foundation
import Yesod.Core

import Operation.Add
import Operation.Subtract
import Operation.Multiply
import Operation.Divide
import Operation.Home
import Operation.Calculations

mkYesodDispatch "App" resourcesApp
