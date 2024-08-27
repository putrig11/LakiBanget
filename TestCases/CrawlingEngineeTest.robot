*** Settings ***
Resource        ../Resources/resource.robot
Test Setup         Go to Admin Page
Test Teardown       Close BROWSER
*** Variables ***


*** Keywords ***


*** Test Cases ***  
Test Read And Input Spesific CrawlPage
    Login To LakiBanget
    Go To Webpage to Crawl     ${Popmama.web_link}        ${Popmama.welcome_screen}
    sleep   5s
    ${PATH_Doc}    Set Variable    ${Popmama.PATH_Doc}
    Set Test Variable    ${PATH_Doc}    
    # Last Artikel Index CrawlPage    aaaa        ${popmama.artitem_title}
    # Loop Open and Copy Artikel to Lakibanget CrawlPage    aaa        ${Popmama.art_list_selector}    ${popmama.artitem_title}
    GeneralWebCrawlPage.Read List Artikel CrawlPage    ${Popmama.art_list_selector}    ${popmama.artitem_title}        ${Popmama_ArticleBody}
    #Open and Copy Artikel CrawlPage to Lakibanget    ${Popmama_ArticleBody}

Test Read and Input Idntimes to Lakibanget
    Login To LakiBanget    ${IdnTimes.user_login}        ${IdnTimes.user_password}
    Go To Webpage to Crawl     ${IdnTimes.web_link}        ${IdnTimes.welcome_screen}
    ${PATH_Doc}    Set Variable    ${IdnTimes.PATH_Doc}
    Set Test Variable    ${PATH_Doc}    
    
    GeneralWebCrawlPage.Read List Artikel CrawlPage    ${IdnTimes.art_list_selector}    ${IdnTimes.artitem_title}        ${IdnTimes_ArticleBody}
        
Test Read and Input Stylo to Lakibanget
    Login To LakiBanget    ${Stylo.user_login}        ${Stylo.user_password}
    Go To Webpage to Crawl     ${Stylo.web_link}        ${Stylo.welcome_screen}
    ${PATH_Doc}    Set Variable    ${Stylo.PATH_Doc}
    Set Test Variable    ${PATH_Doc}    
    
    GeneralWebCrawlPage.Read List Artikel CrawlPage    ${Stylo.art_list_selector}    ${Stylo.artitem_title}        ${Stylo_ArticleBody}


Test Read and Input CrawlPage 
    Login To LakiBanget    ${${SOURCE_ARTICLE}.user_login}        ${${SOURCE_ARTICLE}.user_password}
    Go To Webpage to Crawl     ${${SOURCE_ARTICLE}.web_link}        ${${SOURCE_ARTICLE}.welcome_screen}
    ${PATH_Doc}    Set Variable    ${${SOURCE_ARTICLE}.PATH_Doc}
    Set Test Variable    ${PATH_Doc}   
    
    GeneralWebCrawlPage.Read List Artikel CrawlPage    ${${SOURCE_ARTICLE} .art_list_selector}    ${${SOURCE_ARTICLE}.artitem_title}        ${${SOURCE_ARTICLE}_ArticleBody}

    

Test Read And Input Popmama to Lakibanget
    LoginPage.Login To LakiBanget
    PopmamaPage.Go To Popmama Relationship
    PopmamaPage.Read List Artikel popmama


Test Input ARTIKEL Sooperboy
    Login To LakiBanget
    Go To         ${URL ADMIN}
    # Sooperboy Grooming
    
    