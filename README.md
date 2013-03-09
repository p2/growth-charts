GitHub Page Generation
======================

The branch `gh-pages` contains the generated site to be hosted on GitHub. We use the `gh-pages-jekyll` branch to develop and have jekyll process the site. This is necessary because we are using (a simple) jekyll plugin that won't run on GitHub. So to update the site:

    git checkout gh-pages-jekyll
    git pull
    <edit along>
    jekyll
    git commit

Now this is tricky, we need the plugin to run, meaning we can't use `--safe`, but we also need all links to not be relative since that doesn't seem to work with GitHub. So what to do?? Cherry-picking commits cannot be what we want.

Anyway, then switch to the `gh-pages` branch and copy the generated page over from `_site` and commit:

    git checkout gh-pages
    rsync -a _site/ ./
    git commit
    git push