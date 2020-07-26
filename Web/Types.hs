module Web.Types where
import IHP.Prelude
import qualified IHP.Controller.Session
import qualified IHP.ControllerSupport as ControllerSupport
import IHP.ModelSupport
import Application.Helper.Controller
import IHP.ViewSupport
import Generated.Types
import IHP.LoginSupport.Types -- Login


data WebApplication = WebApplication deriving (Eq, Show)

data ViewContext = ViewContext
    { requestContext :: ControllerSupport.RequestContext
    , flashMessages :: [IHP.Controller.Session.FlashMessage]
    , controllerContext :: ControllerSupport.ControllerContext
    , layout :: Layout
    , user :: Maybe User
    }

data IdeasController
    = IdeasAction
    | NewIdeaAction
    | ShowIdeaAction { ideaId :: !(Id Idea) }
    | CreateIdeaAction
    | EditIdeaAction { ideaId :: !(Id Idea) }
    | UpdateIdeaAction { ideaId :: !(Id Idea) }
    | DeleteIdeaAction { ideaId :: !(Id Idea) }
    | UpvoteAction { ideaId :: !(Id Idea) }
    | DownvoteAction { ideaId :: !(Id Idea) }
    deriving (Eq, Show, Data)

-- Login
instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    | CreateUserAction
    | NewUserAction
    deriving (Eq, Show, Data)
