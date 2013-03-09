GitHub Page Generation
======================

The branch `gh-pages` contains the generated site to be hosted on GitHub. We use the `gh-pages-jekyll` branch to develop and have jekyll process the site. This is necessary because we are using (a simple) jekyll plugin that won't run on GitHub. So to update the site:

    git checkout gh-pages-jekyll
    git pull
    <edit along>
    jekyll --safe
    git commit
    git checkout gh-pages
    rsync -a _site/ ./
    git commit
    git push