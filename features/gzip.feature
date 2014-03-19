Feature: GZIP sitemap build

  Scenario: Sitemap should be gzipped by default
    Given a successfully built app at "gzip-app"
    Then the following files should exist:
      | build/sitemap.xml.gz |
      | build/sitemap.xml |

  Scenario: Sitemap should not be gzipped when option set to false
    Given a fixture app "gzip-app"
    And a file named "config.rb" with:
      """
      activate :sitemap, :gzip => false
      """
    And a successfully built app at "gzip-app"
    When I cd to "build"
    Then the following files should not exist:
      | build/sitemap.xml.gz |

  Scenario: Sitemap should not be gzipped when option set to false
    Given a fixture app "gzip-app"
    And a file named "config.rb" with:
      """
      activate :sitemap, :hostname => "http://www.apple.com"
      """
    And a successfully built app at "gzip-app"
    When I cd to "build"
    Then the file "sitemap.xml" should contain "http://www.apple.com"

  Scenario: Site that has been gzipped
    Given a fixture app "gzip-app"
    And a file named "config.rb" with:
    """
    activate :gzip
    activate :sitemap, :hostname => "http://www.apple.com"
    """
    And a successfully built app at "gzip-app"
    When I cd to "build"
    Then the file "sitemap.xml" should contain "http://www.apple.com"
