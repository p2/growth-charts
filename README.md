GitHub Page Generation
======================

The branch `gh-pages` contains the generated site to be hosted on GitHub.
We use the `gh-pages-jekyll` branch to develop and have jekyll process the site locally.
This is necessary because we are using (a simple) gallery plugin that won't run on GitHub.
So to update the site:

    git checkout gh-pages-jekyll
    git pull
    <edit along>
    jekyll build
    git commit

To test locally you may need to toggle `ASSET_PATH` in the settings file to generate relative paths.

Then switch to the `gh-pages` branch and copy the generated page over from `_site` and commit:

    git checkout gh-pages
    rsync -a _site/ ./
    git commit
    git push

It's probably easier to have both checkouts live side-by-side and copy files over.


## Jekyll

Jekyll is a Ruby gem, and Ruby no longer is preinstalled in OS X (as of Mavericks).
So to run `jekyll`:

    brew install ruby
    sudo gem install jekyll


