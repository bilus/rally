module Web.View.Sessions.NewUser where
import Web.View.Prelude

data NewUserView = NewUserView { user :: User }

instance View NewUserView ViewContext where
    html NewUserView { .. } = [hsx|
        <div class="h-100" id="sessions-new">
            <div class="d-flex align-items-center">
                <div class="w-100">
                    <div style="max-width: 400px" class="mx-auto mb-5">
                        {renderFlashMessages}
                        <h5>Sign up:</h5>
                        {renderForm user}
                    </div>
                </div>
            </div>
        </div>
    |]

renderForm :: User -> Html
renderForm user = [hsx|
    <form method="POST" action={CreateUserAction}>
        <div class="form-group">
            <input name="email" value={get #email user} type="email" class="form-control" placeholder="E-Mail"/>
        </div>
        <div class="form-group">
            <input name="passwordHash" type="password" class="form-control" placeholder="Password"/>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Sign up</button>
    </form>
|]
