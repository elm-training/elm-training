module ElmArchitectureModules.ImportingFiles exposing (..)


{-
So far we've only done everything in a single file. This doesn't scale. Eventually you'll need to import other files.

The file name should match the directory structure, like in this very file.

*TODO* get more info on this so I'm not just making it up.

When you type  `import Something.Whatever` Elm checks in a few places. It checks if there is a package you've installed with `elm-package` that matches that lookup path. Next it checks your `"source-directories"` paths in your elm-package.json for files that match the module name.

If you aren't importing the module from anywhere, the module name doesn't matter. If you are, it needs to match the path Elm will use to look it up.

-}

-- EXERCISE: Create a file named `Utils.elm` in this same directory with a single function inside it. Import that function in to this file.
