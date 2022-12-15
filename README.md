# action-releasr-go

<p align="center">
  <a href="https://github.com/PackagrIO/docs">
  <img width="300" alt="portfolio_view" src="https://github.com/PackagrIO/releasr/raw/master/images/releasr.png">
  </a>
</p>

Github Action that allows you to commit local changes & tag Go repositories

# Documentation
Full documentation is available at [PackagrIO/docs](https://github.com/PackagrIO/docs)

# Usage

```yaml
name: Release
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    container: ghcr.io/packagrio/packagr-dev:master
    env:
      PROJECT_PATH: /go/src/github.com/packagrio/publishr
    steps:
      # Fetch depth 0 is required for committing changes
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
      # ... do your compile, testing, bumpr, etc steps here.
      - name: Commit Changes
        id: commit
        uses: packagrio/action-releasr-node@master
        env:
          # This is necessary in order to push a commit to the repo
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }} # Leave this line unchanged

      # ... do your publishr steps here.

```

# Inputs

# Outputs
