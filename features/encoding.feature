Feature: Encode HTML entities

  Scenario: URLs in loc entities are HTML encoded
    Given a successfully built app at "weird-urls-app"
    When I cd to "build"
    Then the file "sitemap.xml" should contain "<loc>http://www.example.com/this-&amp;-that.html</loc>"

  Scenario: Subdirectories
    Given a successfully built app at "subdirectories-app"
    When I cd to "build"
    Then the file "sitemap.xml" should contain "<loc>http://www.example.com/error-pages/404.html</loc>"
