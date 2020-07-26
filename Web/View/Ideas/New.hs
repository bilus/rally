module Web.View.Ideas.New where
import Web.View.Prelude

data NewView = NewView { idea :: Idea }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={IdeasAction}>Ideas</a></li>
                <li class="breadcrumb-item active">New Idea</li>
            </ol>
        </nav>
        <h1>New Idea</h1>
        {renderForm idea}
    |]

renderForm :: Idea -> Html
renderForm idea = formFor idea [hsx|
    {textField #title}
    {textareaField #explanation}
    {submitButton}
|]
