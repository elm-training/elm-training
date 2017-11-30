module ElmArchitectureModules.ImportingFiles exposing (..)

-- import ElmArchitectureModules.Imports
-- import ElmArchitectureModules.Imports as Imports

{-
So far we've only done everything in a single file. This doesn't scale. Eventually you'll need to import other files.

The file name should match the directory structure, like in this very file.


When you type  `import Something.Whatever` Elm checks in a few places. It checks if there is a package you've installed with `elm-package` that matches that lookup path. Next it checks your `"source-directories"` paths in your elm-package.json for files that match the module name.

If you aren't importing the module anywhere, like when it is the main entry point to your application, you don't need to make the name match the directory structure and file name. If you are, it needs to match the path Elm will use to look it up.

LEARN: How to import and export elm code.

DEMO: Import the whole Imports.elm file by itself.
DEMO: Import aliased to Imports
DEMO: Import individual things from it
DEMO: Import infix operator (also this is why infix operators suck)

-}




-- EXERCISE: You are feeling STRONG. Import String but alias it as STRONG to reflect your newfound strength. Make this function compile.

isLongString : String -> Bool
isLongString str =
  Debug.crash "Fix the following"
  -- STRONG.length str > 1000



-- EXERCISE: Create a file named `Utils.elm` in this same directory with a single function inside it. Import that function in to this file.
