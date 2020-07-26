module Web.Controller.Ideas where

import Web.Controller.Prelude
import Web.View.Ideas.Index
import Web.View.Ideas.New
import Web.View.Ideas.Edit
import Web.View.Ideas.Show
import Web.View.Ideas.Index
import Web.View.Ideas.New
import Web.View.Ideas.Show
import Web.View.Ideas.Edit

instance Controller IdeasController where
    beforeAction = ensureIsUser

    action DownvoteAction { ideaId } = do
        idea <- fetch ideaId
        let votes = (get #votes idea)
        idea
            |> set #votes (votes - 1)
            |> updateRecord

        redirectTo IdeasAction

    action UpvoteAction { ideaId } = do
        idea <- fetch ideaId
        let votes = (get #votes idea)
        idea
            |> set #votes (votes + 1)
            |> updateRecord
        redirectTo IdeasAction

    action IdeasAction = do
        ideas :: [Include "authorId" Idea] <- query @Idea
          |> orderByDesc #votes
          |> fetch
          >>= collectionFetchRelated #authorId
        render IndexView { .. }

    action NewIdeaAction = do
        let idea = newRecord
        render NewView { .. }

    action ShowIdeaAction { ideaId } = do
        idea <- fetch ideaId
        render ShowView { .. }

    action EditIdeaAction { ideaId } = do
        idea <- fetch ideaId
        ensureUserIsAuthor idea
        render EditView { .. }

    action UpdateIdeaAction { ideaId } = do
        idea <- fetch ideaId
        ensureUserIsAuthor idea
        idea
            |> buildIdea
            |> ifValid \case
                Left idea -> render EditView { .. }
                Right idea -> do
                    idea <- idea |> updateRecord
                    setSuccessMessage "Idea updated"
                    redirectTo EditIdeaAction { .. }

    action CreateIdeaAction = do
        let authorId = (get #id currentUser)
            idea = newRecord @Idea
                        |> set #authorId authorId
        idea
            |> buildIdea
            |> ifValid \case
                Left idea -> render NewView { .. }
                Right idea -> do
                    idea <- idea |> createRecord
                    setSuccessMessage "Idea created"
                    redirectTo IdeasAction

    action DeleteIdeaAction { ideaId } = do
        idea <- fetch ideaId
        ensureUserIsAuthor idea
        deleteRecord idea
        setSuccessMessage "Idea deleted"
        redirectTo IdeasAction

buildIdea idea = idea
    |> fill @["title","explanation"]
    |> validateField #title nonEmpty

ensureUserIsAuthor idea =
  accessDeniedUnless $ get #authorId idea == currentUserId
