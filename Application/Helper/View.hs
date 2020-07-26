module Application.Helper.View (
    -- Use the built in login:
    module IHP.LoginSupport.Helper.View,
    isAuthor

) where

-- Use the built in login:
import           IHP.LoginSupport.Helper.View

import IHP.Prelude
import Generated.Types
import IHP.ModelSupport
import Web.Types

-- Here you can add functions which are available in all your views

isAuthor :: (?viewContext :: ViewContext) => Include "authorId" Idea -> Bool
isAuthor idea =
  get #authorId idea == currentUser
