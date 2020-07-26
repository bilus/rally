module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute IdeasController
type instance ModelControllerMap WebApplication Idea = IdeasController

-- Login
instance AutoRoute SessionsController
