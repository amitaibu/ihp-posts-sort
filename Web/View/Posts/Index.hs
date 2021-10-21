module Web.View.Posts.Index where
import Web.View.Prelude

data IndexView = IndexView { posts :: [Post] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <div><a href={pathTo NewPostAction} class="inline-block btn btn-primary">+ New</a></div>

        {renderPosts posts}
    |]


renderPosts posts =
    if null posts
        then mempty
        else [hsx|
            <form method="POST" action={SortPostsAction}>
                <ul class="list-group my-8 px-4 py-6 border border-gray-500" id="sortable">
                    {forM_ posts renderPost}
                </ul>

                {button}

            </form>
        |]
            where button =
                    if length posts > 1
                        then [hsx|
                            <input type="submit" class="btn btn-primary" value="Re-order"/>
                            <!-- jsDelivr :: Sortable :: Latest (https://www.jsdelivr.com/package/npm/sortablejs) -->
                            <script src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>
                            <script src={assetPath "/postsSortable.js"}></script>
                        |]
                        else [hsx|<div class="inline-block btn bg-gray-400">Re-order</div>|]

renderPost post = [hsx|
    <li class="list-group-item flex flex-row space-x-4 border-b border-gray-200 py-6 px-2 hover:bg-green-50">
        <div class="handle">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 11.5V14m0-2.5v-6a1.5 1.5 0 113 0m-3 6a1.5 1.5 0 00-3 0v2a7.5 7.5 0 0015 0v-5a1.5 1.5 0 00-3 0m-6-3V11m0-5.5v-1a1.5 1.5 0 013 0v1m0 0V11m0-5.5a1.5 1.5 0 013 0v3m0 0V11" />
            </svg>
        </div>
        <div>{get #title post}</div>
        <div><a href={ShowPostAction (get #id post)}>Show</a></div>
        <div><a href={EditPostAction (get #id post)} class="text-muted">edit</a></div>
        <div><a href={DeletePostAction (get #id post)} class="js-delete text-muted">Delete</a></div>

        <input type="hidden" name="postId" value={show $ get #id post} />
    </li>
|]
