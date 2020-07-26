module Application.Helper.Controller (
    -- To use the built in login:
    module IHP.LoginSupport.Helper.Controller
) where

-- To use the built in login:
import IHP.LoginSupport.Helper.Controller
import Generated.Types
type instance CurrentUserRecord = User

-- Here you can add functions which are available in all your controllers
