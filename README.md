# Middleman-Sitemap

`middleman-sitemap` is an extension for the [Middleman] static site generator that adds sitemap functionality. By default, the sitemap is GZIP'd.

For large sites, `middleman-sitemap` will create a sitemap index file and multiple sitemaps as suggested by [Google](https://support.google.com/webmasters/answer/183668?hl=en&ref_topic=4581190).

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

By default, `middleman-sitemap` will create a sitemap with `loc1 elements. As per the [protocol](http://www.sitemaps.org/protocol.html), the `lastmod`, `changefreq`, and `priority` elements are optional. To include these elements in your sitemap, you MUST include them in the front matter of your page.

## Options

### GZIP

GZIP is on by default, so the extension will produce a sitemap.xml.gz file in addition to the sitemap.xml file.

If you don't want to create a GZIP file, pass `false` during activation.

```
activate :sitemap, :gzip => false
```

### Hostname

The default hostname is set to "http://www.example.com". You probably want to change this to your hostname.

```
activate :sitemap, :hostname => "http://www.apple.com"
```


## Build & Dependency Status

[![Build Status](https://travis-ci.org/statonjr/middleman-sitemap.png)][travis]

## Community

The official community forum is available at: http://forum.middlemanapp.com

## Bug Reports

Github Issues are used for managing bug reports and feature requests. If you run into issues, please search the issues and submit new problems: https://github.com/middleman/middleman-blog/issues

The best way to get quick responses to your issues and swift fixes to your bugs is to submit detailed bug reports, include test cases and respond to developer questions in a timely manner. Even better, if you know Ruby, you can submit [Pull Requests](https://help.github.com/articles/using-pull-requests) containing Cucumber Features which describe how your feature should work or exploit the bug you are submitting.

## How to Run Cucumber Tests

*WARNING*: Support for multiple sitemaps means that Middleman has to build 51000 pages before creating the multiple sitemaps which, on my machine, takes almost 5 minutes per scenario. The multiple-sitemap features have been tagged with `@slow`.

1. Checkout Repository: `git clone https://github.com/statonjr/middleman-sitemap.git`
2. Install Bundler: `gem install bundler`
3. Run `bundle install` inside the project root to install the gem dependencies.
4. Run test cases: `bundle exec rake test`

## Donate

[Click here to lend your support to Middleman](https://spacebox.io/s/4dXbHBorC3)

## License

Copyright (c) 2014 Larry Staton Jr. MIT Licensed, see [LICENSE] for details.

[middleman]: http://middlemanapp.com
[travis]: http://travis-ci.org/statonjr/middleman-sitemap
[LICENSE]: https://github.com/statonjr/middleman-sitemap/blob/master/LICENSE
