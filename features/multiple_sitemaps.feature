Feature: Multiple sitemaps for large sites

  @slow
  Scenario: Site should have sitemap index file
    Given a successfully built app at "large-site-app"
    Then the following files should exist:
      | build/sitemap.xml |

  @slow
  Scenario: Site should have multiple sitemaps
    Given a successfully built app at "large-site-app"
    Then the following files should exist:
      | build/sitemap1.xml |
      | build/sitemap2.xml |
