*** Variables ***
${last_artIndex}=         0
${title_onthelist_selector}=            xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item'][${j}]//div[@class='col-xs-5']    

        
*** Keywords ***
Update Newest Title CrawlPage
    [Arguments]         ${latest_arttitle}
    Create File	        ${PATH_Doc}	    ${latest_arttitle}
    File Should Exist	${PATH_Doc}	

Copy File
    Copy File	        ${PATH_Doc}	~/file.txt
    ${output} =	        Run	    ${TEMPDIR}${/}script.py arg
    log to console      ${output}

Read Latest Artikel title
    ${last_title}=    Get File  ${PATH_Doc}
    [Return]    ${last_title}


Read and Compare Artikel title
    [Arguments]         ${art_title}
    ${File}=    Get File  ${PATH_Popmama}
    Run Keyword If    '${File}'=='${art_title}'    Log To console    samasdsdsadsd
    ...    ELSE     Log To console    bedasdsdsd

Go To Webpage to Crawl
    [Arguments]        ${web_link}        ${welcome_screen_selector}

    #${web_link}=        https://www.popmama.com/life/relationship
    #${welcome_screen_selector}=        xpath=//h2[@class='sub-cat-title']//span[contains(text(),'Relationship')]
    
    Set Test Variable        ${web_link}
    Set Test Variable        ${welcome_screen_selector}
    Go to         ${web_link}
    Wait Until Element Is Visible        ${welcome_screen_selector}
    Reload Page

Last Artikel Index CrawlPage
    [Arguments]        ${last_title}    ${artitem_title}
    
    #${artitem_head}=        xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item']
    #${artitem_title}=       //div[@class='col-xs-7']//div//a//h3 
    #${artitem_title_selector}=        xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item'][${j}]//div[@class='col-xs-7']//div//a//h3
    
    Log   ${artitem_title}
    FOR   ${j}    IN RANGE    ${10}
        ${j}=    evaluate       ${j}+${1}
        
        ${locator}        Set Variable   ${artitem_title.replace("%", "${j}")}
        Scroll Element Into View        ${locator}
        
        ${art_title}=       Get Text    ${locator}

        ${art_title}=    Remove String    ${art_title}     '
        ${art_title}=    Remove String    ${art_title}     "
        ${last_title}=    Remove String    ${last_title}     '
        ${last_title}=    Remove String    ${last_title}     "
    

        Exit For Loop If    "${last_title}" == "${art_title}"
        ${last_artIndex}=         evaluate        ${j}+${0}
        Log     ${last_artIndex}     
       
    END    

    Set Test Variable    ${last_artIndex}

Read List Artikel CrawlPage
    [Arguments]       ${art_list_selector}        ${artitem_title}        ${Body_Article}
    
    Wait Until Element Is Visible                 ${art_list_selector}
    ${last_title}=            GeneralWebCrawlPage.Read Latest Artikel title
    
    Last Artikel Index CrawlPage    ${last_title}        ${artitem_title}
    Loop Open and Copy Artikel to Lakibanget CrawlPage       ${last_title}      ${art_list_selector}    ${artitem_title}    ${Body_Article}


Loop Open and Copy Artikel to Lakibanget CrawlPage
    [Arguments]        ${last_title}        ${art_list_selector}    ${artitem_title}    ${Body_Article}
    
    FOR    ${j}    IN RANGE    ${last_artIndex}
        ${j}=    evaluate       ${last_artIndex}-${j}
        
        Go To Webpage to Crawl    ${web_link}    ${welcome_screen_selector}
        Sleep  5s
        Wait Until Element Is Visible                 ${art_list_selector}

        ${artitem}        Set Variable   ${artitem_title.replace("%", "${j}")}
        
        CommonFunctionality.Scroll Element Into View X    ${artitem}    
        ${art_title}=       Get Text    ${artitem}

        sleep  2s
        Click Element                   ${artitem}
        Log To console        loop halaman j ${j}
        Open and Copy Artikel CrawlPage to Lakibanget    ${Body_Article}
        Update Newest Title CrawlPage     ${art_title}
        
    END


Check and Close Udah Dong Button
    [Arguments]        ${selector}
    Set Test Variable        ${selector}
    ${button_udahdong}    ${value}=       Run Keyword and Ignore Error    Wait Until Element Is Visible        ${selector}    timeout=2s
    Run Keyword If    '${button_udahdong}'=='PASS'      GeneralWebCrawlPage.Click Udah Dong

Click Udah Dong
    Wait Until Element Is Visible    ${selector}    
    Click Element            ${selector}

Check and close Main Banner Popup
    [Arguments]        ${selector}
    Set Test Variable        ${selector}
    ${item}    ${value}=       Run Keyword and Ignore Error    Wait Until Element Is Visible        ${selector}    timeout=2s
    Run Keyword If    '${item}'=='PASS'      GeneralWebCrawlPage.Click Close Main Banner Popup

Click Close Main Banner Popup
    Wait Until Element Is Visible    ${selector}
    Click Element                    ${selector}

Check and Click Show All
    [Arguments]        ${selector}
    Set Test Variable        ${selector}
    ${button_showall}    ${value}=       Run Keyword and Ignore Error     Wait Until Page Contains Element        ${selector}    timeout=2s
    Run Keyword If    '${button_showall}'=='PASS'      GeneralWebCrawlPage.Click Show All

    
Click Show All
    CommonFunctionality.Scroll Element Into View X    ${selector}
    ${button_showall}    ${value}=       Run Keyword and Ignore Error    Wait Until Element Is Visible        ${selector}    timeout=2s
    Wait Until Element Is Visible    ${selector}    
    Click Element            ${selector}


Open and Copy Artikel CrawlPage to Lakibanget
    [Arguments]        ${Body_Article}
    sleep    2s

    GeneralWebCrawlPage.Check and Close Udah Dong Button    ${Body_Article.udah_dong}
    GeneralWebCrawlPage.Check and close Main Banner Popup    ${Body_Article.mainbanner}
    ${source_url}       get location
    sleep    2s
    GeneralWebCrawlPage.Check and Click Show All    ${Body_Article.show_all}
    CommonFunctionality.Scroll Element Into View X    ${Body_Article.body_content}
    CommonFunctionality.Scroll Element Vertical Into View        ${Body_Article.end_body}

    ${art_title}=             Get Text        ${Body_Article.art_title_sel}
    ${art_body}=              Get Text        ${Body_Article.art_body_sel}
    ${art_img}=               Get Element Attribute        ${Body_Article.art_img_sel}        src
       
    
    #Paste To LakiBanget
    Go to       ${URL ADMIN}
    AdminPage.Input New Article    ${art_title}    ${art_img} ${art_body} ${source_url}
    

Create Latest Artikel popmama to file
    [Arguments]    ${art_title}

Read Last Artikel Updated in file
    [Return]    ${art_title}


