module Web.View.Ideas.Index where
import Web.View.Prelude

data IndexView = IndexView { ideas :: [Include "authorId" Idea] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={IdeasAction}>Ideas</a></li>
            </ol>
        </nav>
        <h1>Ideas <a href={pathTo NewIdeaAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <tbody>{forEach ideas renderIdea}</tbody>
            </table>
        </div>
    |]


renderIdea idea = [hsx|
    <tr>
        <td>
            { get #votes idea }
        </td>
        <td>
            <a href={UpvoteAction (get #id idea)} class="js-update">Upvote</a>
        </td>
        <td>
            <a href={DownvoteAction (get #id idea)} class="js-update">Downvote</a>
        </td>
        <td><a href={ShowIdeaAction (get #id idea)}>{get #title idea}</a></td>
        <td>{author idea}</td>
        <td>{get #createdAt idea |> timeAgo}</td>
    </tr>
|]

author idea =
  let author = (get #authorId idea) in
    (get #email author)
