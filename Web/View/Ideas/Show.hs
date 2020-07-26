module Web.View.Ideas.Show where
import Web.View.Prelude
import qualified Text.MMark as MD

data ShowView = ShowView { idea :: Idea }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={IdeasAction}>Ideas</a></li>
                <li class="breadcrumb-item active">{get #title idea}</li>
            </ol>
        </nav>
        <h1>{get #title idea}</h1>
        <p>{get #explanation idea |> fromMarkdown}</p>
    |]

fromMarkdown text =
  case text |> MD.parse "" of
    Left error -> "Something went wrong"
    Right markdown -> MD.render markdown |> tshow |> preEscapedToHtml
