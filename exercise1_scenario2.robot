*** Settings ***
Library                                  SeleniumLibrary

Test Teardown   Close The Browser

*** Variables ***
${browser}                               Chrome
${eBayURL}                               https://www.ebay.com/
${searchField}                           css:#gh-ac-box2 .ui-autocomplete-input
${searchButton}                          css:#gh-btn
${searchResult}                          css:#mainContent
${dropdownCategory}                      css:#gh-cat-box
${chooseComputerAndNetworking}           css:div#gh-cat-box .gh-sb [value="58058"]


*** Keywords ***
Open eBay website with Chrome
    Open Browser                         ${eBayURL}            ${browser}
    Maximize Browser Window

Click search
    Click Element                        ${searchField}

Input Keyword "Macbook"
    Input Text                           ${searchField}        MacBook

Click Search Button
    Click Button                         ${searchButton}

Will Show All Search Result Page
    Wait Until Page Contains Element     ${searchResult}

Change the Category to Computers/Tablets & Networking
    Click Element                        ${dropdownCategory}
    Sleep                                1 seconds
    Click Element                        ${chooseComputerAndNetworking}
    Sleep                                1 seconds

Will Show Category Computers/Tablets & Networking Search Result Page
    Wait Until Page Contains Element     ${searchResult}

Close The Browser
    Close Browser
  

*** Test Cases ***
Access a Product via Search
    Given Open eBay website with Chrome
    When Click Search
    And Input Keyword "Macbook"
    And Click Search Button
    Then Will Show All Search Result Page
    Given Change the Category to Computers/Tablets & Networking
    When Click Search Button
    Then Will Show Category Computers/Tablets & Networking Search Result Page