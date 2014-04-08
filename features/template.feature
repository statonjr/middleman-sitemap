Feature: Default template

  Scenario: Sitemap should have loc element
    Given a successfully built app at "template-app"
    When I cd to "build"
    Then the file "sitemap.xml" should contain "<loc>http://www.example.com</loc>"

  Scenario: Sitemap should not have lastmod element
    Given a successfully built app at "template-app"
    When I cd to "build"
    Then the file "sitemap.xml" should not contain "<lastmod>"

  Scenario: Sitemap should not have changefreq element
    Given a successfully built app at "template-app"
    When I cd to "build"
    Then the file "sitemap.xml" should not contain "<changefreq>"

  Scenario: Sitemap should not have priority element
    Given a successfully built app at "template-app"
    When I cd to "build"
    Then the file "sitemap.xml" should not contain "<priority>"

  Scenario: Page with relevant sitemap front matter should show up in sitemap
    Given a successfully built app at "sitemap-frontmatter-app"
    When I cd to "build"
    Then the file "sitemap.xml" should contain "<priority>" 
