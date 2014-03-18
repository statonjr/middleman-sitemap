# Middleman-Sitemap

`middleman-sitemap` is an extension for the [Middleman] static site generator that adds sitemap functionality. By default, the sitemap is GZIP'd.

## Installation

If you're just getting started, install the `middleman` gem and generate a new project:

```
gem install middleman
middleman init MY_PROJECT
```

If you already have a Middleman project: Add `gem "middleman-sitemap"` to your `Gemfile` and run `bundle install`

## Configuration

```
activate :sitemap
```

## Build & Dependency Status

[![Build Status](https://travis-ci.org/statonjr/middleman-sitemap.png)][travis]

## Community

The official community forum is available at: http://forum.middlemanapp.com

## Bug Reports

Github Issues are used for managing bug reports and feature requests. If you run into issues, please search the issues and submit new problems: https://github.com/middleman/middleman-blog/issues

The best way to get quick responses to your issues and swift fixes to your bugs is to submit detailed bug reports, include test cases and respond to developer questions in a timely manner. Even better, if you know Ruby, you can submit [Pull Requests](https://help.github.com/articles/using-pull-requests) containing Cucumber Features which describe how your feature should work or exploit the bug you are submitting.

## How to Run Cucumber Tests

1. Checkout Repository: `git clone https://github.com/statonjr/middleman-sitemap.git`
2. Install Bundler: `gem install bundler`
3. Run `bundle install` inside the project root to install the gem dependencies.
4. Run test cases: `bundle exec rake test`

## Donate

[Click here to lend your support to Middleman](https://spacebox.io/s/4dXbHBorC3)

## License

Copyright (c) 2014 Larry Staton Jr.. MIT Licensed, see [LICENSE] for details.

[middleman]: http://middlemanapp.com
[travis]: http://travis-ci.org/statonjr/middleman-sitemap
[LICENSE]: https://github.com/statonjr/middleman-sitemap/blob/master/LICENSE.md
