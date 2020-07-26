module Web.Controller.Sessions where

import qualified IHP.AuthSupport.Controller.Sessions as Sessions
import           Web.Controller.Prelude
import           Web.View.Sessions.New
import           Web.View.Sessions.NewUser

instance Controller SessionsController where
    action NewUserAction = do
        ensureIsUser
        let user = newRecord @User
        render NewUserView { .. }

    action CreateUserAction = do
        ensureIsUser
        let user = newRecord @User
        user
            |> fill @["email", "passwordHash"]
            |> validateField #email isEmail
            |> validateField #passwordHash nonEmpty
            |> ifValid \case
                Left user -> render NewUserView { .. }
                Right user -> do
                    hashed <- hashPassword (get #passwordHash user)
                    user <- user
                        |> set #passwordHash hashed
                        |> createRecord
                    setSuccessMessage "You have registered successfully"
        redirectTo NewSessionAction

    action NewSessionAction = Sessions.newSessionAction @User
    action CreateSessionAction = Sessions.createSessionAction @User
    action DeleteSessionAction = Sessions.deleteSessionAction @User

instance Sessions.SessionsControllerConfig User where
