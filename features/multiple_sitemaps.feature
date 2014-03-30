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

  @slow
  Scenario: Sitemap index should have proper content
    Given a successfully built app at "large-site-app"
    When I cd to "build"
    Then the file "sitemap.xml" should contain "</sitemapindex>"
    And the file "sitemap.xml" should contain "http://www.example.com/sitemap1.xml.gz"
    And the file "sitemap.xml" should contain "http://www.example.com/sitemap2.xml.gz"

  @slow
  Scenario: Sitemap index should have proper URLs when GZIP is false
    Given a fixture app "large-site-app"
    And a file named "config.rb" with:
    """
    activate :sitemap, :gzip => false
    """
    And a successfully built app at "large-site-app"
    When I cd to "build"
    Then the file "sitemap.xml" should contain "</sitemapindex>"
    And the file "sitemap.xml" should contain "http://www.example.com/sitemap1.xml"
    And the file "sitemap.xml" should contain "http://www.example.com/sitemap2.xml"

  @slow
  Scenario: Sitemaps should have proper content
    Given a successfully built app at "large-site-app"
    When I cd to "build"
    Then the file "sitemap1.xml" should contain "</urlset>"
    And the file "sitemap1.xml" should contain "http://www.example.com/page00001.html"
    And the file "sitemap2.xml" should contain "http://www.example.com/page50000.html"

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
