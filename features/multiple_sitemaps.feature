Feature: Multiple sitemaps for large sites

  @slow
  Scenario: Site should have sitemap index file
    Given a successfully built app at "large-site-app"
    Then the following files should exist:
      | build/sitemap.xml |

  @slow
  Scenario: Large site should have multiple sitemaps
    Given a successfully built app at "large-site-app"
    Then the following files should exist:
      | build/sitemap1.xml |
      | build/sitemap2.xml |

  Scenario: Small site should have multiple sitemaps
    Given a successfully built app at "gzip-app"
    Then the following files should not exist:
      | build/sitemap1.xml |
      | build/sitemap2.xml |

  @slow
  Scenario: Site should have multiple sitemaps even when gzipped
    Given a fixture app "large-site-app"
    And a file named "config.rb" with:
    """
    activate :gzip
    activate :sitemap
    """
    And a successfully built app at "large-site-app"
    Then the following files should exist:
      | build/sitemap1.xml |
      | build/sitemap2.xml |
