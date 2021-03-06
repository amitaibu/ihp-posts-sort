module Web.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Web.Types
import Web.Routes
import qualified IHP.FrameworkConfig as FrameworkConfig
import Config ()

defaultLayout :: Html -> Html
defaultLayout inner = H.docTypeHtml ! A.lang "en" $ [hsx|
<head>
    {metaTags}

    <link rel="stylesheet" href="/app.css"/>

    {scripts}

    <title>Posts Sortable</title>
</head>
<body class="max-w-7xl mx-auto sm:px-6 lg:px-8 mt-12">
        {renderFlashMessages}
        {inner}
</body>
|]

scripts :: Html
scripts = do
    when isDevelopment [hsx|<script id="livereload-script" src="/livereload.js"></script>|]
    [hsx|
        <script src="/vendor/morphdom-umd.min.js"></script>
        <script src="/vendor/jquery-3.6.0.slim.min.js"></script>
        <script src="/vendor/timeago.js"></script>
        <script src="/helpers.js"></script>
    |]
    when isProduction [hsx|
            <script src="/vendor/turbolinks.js"></script>
            <script src="/vendor/morphdom-umd.min.js"></script>
            <script src="/vendor/turbolinksMorphdom.js"></script>
            <script src="/vendor/turbolinksInstantClick.js"></script>
        |]

metaTags :: Html
metaTags = [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
|]
