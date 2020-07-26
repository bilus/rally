module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import Web.Controller.Ideas
import IHP.Welcome.Controller

-- Login:
import IHP.LoginSupport.Middleware
import Web.Controller.Sessions

instance FrontController WebApplication where
    controllers =
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @IdeasController
        , parseRoute @SessionsController -- Login.
        ]

instance InitControllerContext WebApplication where
  -- Login
  initContext =
        initAuthentication @User
