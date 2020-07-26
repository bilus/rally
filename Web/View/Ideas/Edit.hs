module Web.View.Ideas.Edit where
import Web.View.Prelude

data EditView = EditView { idea :: Idea }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={IdeasAction}>Ideas</a></li>
                <li class="breadcrumb-item active">Edit Idea</li>
            </ol>
        </nav>
        <h1>Edit Idea</h1>
        {renderForm idea}
    |]

renderForm :: Idea -> Html
renderForm idea = formFor idea [hsx|
    {textField #title}
    {textareaField #explanation}
    {submitButton}
|]
