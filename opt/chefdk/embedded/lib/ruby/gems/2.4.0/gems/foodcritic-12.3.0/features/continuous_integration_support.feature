Feature: Continuous Integration Support

  In order to be able to quickly identify problems with my cookbooks
  As a developer
  I want to be able to fail the build for a subset of warnings

  Scenario: Command help
    Given I have installed the lint tool
     When I run it on the command line with the help option
     Then the usage text should include an option for specifying tags that will fail the build

  Scenario Outline: Fail the build for certain tags
    Given a cookbook that matches rules <cookbook_matches>
    When I check the cookbook specifying tags <tag_arguments>
    Then the warnings shown should be <warnings_shown>
     And the build status should be <build_status>

  Examples:
    | cookbook_matches  | tag_arguments                 | warnings_shown    | build_status |
    | FC002,FC004       |                               | FC002,FC004       | failed       |
    | FC002,FC004       | -t style                      | FC002             | failed       |
    | FC002,FC004       | -t style -f ~any              | FC002             | successful   |
    | FC002,FC004       | -f FC005                      | FC002,FC004       | successful   |
    | FC002,FC004       | -f FC004                      | FC002,FC004       | failed       |
    | FC002,FC004       | --epic-fail FC002             | FC002,FC004       | failed       |
    | FC002,FC005       | -f ~any                       | FC002,FC005       | successful   |
    | FC002,FC005       | -f any -f ~FC014              | FC002,FC005       | failed       |
    | FC002,FC005       | -f any,~FC014                 | FC002,FC005       | failed       |
    | FC002             | -f ~FC002 -f ~metadata        | FC002             | failed       |
    | FC002,FC005       | -f ~FC002                     | FC002,FC005       | failed       |
    | FC002,FC005       | -f any -f ~FC002              | FC002,FC005       | failed       |
    | FC002             | -f any,~FC002                 | FC002             | failed       |
    | FC002             | -f any -f ~FC002 -f ~metadata | FC002             | failed       |
    | FC002,FC005       | -f any,~FC002                 | FC002,FC005       | failed       |
    | FC002,FC005       | -f ~FC002 -f ~FC004           | FC002,FC005       | failed       |
