*** Variables ***
${last_artIndex}=         0

        
*** Keywords ***
Update Newest Title
    [Arguments]         ${latest_arttitle}
    Create File	        ${PATH_Popmama}	    ${latest_arttitle}
    File Should Exist	${PATH_Popmama}	

Copy File
    Copy File	        ${PATH_Popmama}	~/file.txt
    ${output} =	        Run	    ${TEMPDIR}${/}script.py arg
    log to console      ${output}

Read Latest Artikel title
    ${last_title}=    Get File  ${PATH_Popmama}
    [Return]    ${last_title}


Read and Compare Artikel title
    [Arguments]         ${art_title}
    ${File}=    Get File  ${PATH_Popmama}
    Run Keyword If    '${File}'=='${art_title}'    Log To console    samasdsdsadsd
    ...    ELSE     Log To console    bedasdsdsd

Go To Popmama Relationship
    Go to         https://www.popmama.com/life/relationship
    Wait Until Element Is Visible        xpath=//h2[@class='sub-cat-title']//span[contains(text(),'Relationship')]
    Reload Page

Last Artikel Index Popmama
    [Arguments]        ${last_title}
    
    FOR   ${j}    IN RANGE    ${10}
        ${j}=    evaluate       ${j}+${1}
        
        Scroll Element Into View        xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item'][${j}]//div[@class='col-xs-5']    
        ${art_title}=       Get Text    xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item'][${j}]//div[@class='col-xs-7']//div//a//h3

        Exit For Loop If    "${last_title}" == "${art_title}"
        ${last_artIndex}=         evaluate        ${j}+${0}
        Log     ${last_artIndex}     
       
    END    

    Set Test Variable    ${last_artIndex}

Read List Artikel popmama
    ${art_list}=              Set Variable        //div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item']
    Set Test Variable        ${art_list}
    Wait Until Element Is Visible                 xpath=${art_list}
    ${jumlah_artikel}=        Get Element Count   xpath=${art_list}
    ${last_title}=            PopmamaPage.Read Latest Artikel title
    ${newest_title}=          Get Text            xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item'][1]//div[@class='col-xs-7']//div//a//h3
    
    PopmamaPage.Last Artikel Index Popmama    ${last_title}
    PopmamaPage.Loop Open and Copy Artikel to Lakibanget    ${last_title}



Loop Open and Copy Artikel to Lakibanget
    [Arguments]        ${last_title}
    
    FOR    ${j}    IN RANGE    ${last_artIndex}
        ${j}=    evaluate       ${last_artIndex}-${j}
        
        Go To Popmama Relationship
        Wait Until Element Is Visible                 xpath=${art_list}
    
        CommonFunctionality.Scroll Element Into View X        xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item'][${j}]//div[@class='col-xs-5']    
        ${art_title}=       Get Text    xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item'][${j}]//div[@class='col-xs-7']//div//a//h3

        #Exit For Loop If    "${last_title}" == "${art_title}"
        sleep  2s
        Click Element                   xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item'][${j}]//div[@class='col-xs-5']
        Log To console        loop halaman j ${j}
        Open and Copy Artikel to Lakibanget
        PopmamaPage.Update Newest Title    ${art_title}
        
    END


Check and Close Udah Dong Button
    ${button_udahdong}    ${value}=       Run Keyword and Ignore Error    Wait Until Element Is Visible        xpath=//button[@class='confirm btn btn-lg btn-length btn-danger']    timeout=2s
    Run Keyword If    '${button_udahdong}'=='PASS'      Click Udah Dong

Click Udah Dong
    Wait Until Element Is Visible    xpath=//button[@class='confirm btn btn-lg btn-length btn-danger']    
    Click Element            xpath=//button[@class='confirm btn btn-lg btn-length btn-danger']

Check and close Main Banner Popup
    ${item}    ${value}=       Run Keyword and Ignore Error    Wait Until Element Is Visible        xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button    timeout=2s
    Run Keyword If    '${item}'=='PASS'      Click Close Main Banner Popup

Click Close Main Banner Popup
    Wait Until Element Is Visible    xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button
    Click Element                    xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button

Open and Copy Artikel to Lakibanget
    sleep    2s

    Check and Close Udah Dong Button    
    Check and close Main Banner Popup
    
    ${source_url}       get location

    CommonFunctionality.Scroll Element Into View X    xpath=//div[@id='article-content']
    CommonFunctionality.Scroll Element Vertical Into View        xpath=//div[@class='_491z clearfix']

    ${art_title}=             Get Text        xpath=//h1[@class='title']
    ${art_body}=              Get Text        xpath=//div[@id='article-content']
    ${art_img}=               Get Element Attribute        xpath=//div[@class='single-cover']//figure//img        src
       
    
    #Paste To LakiBanget
    Go to       ${URL ADMIN}
    AdminPage.Input New Article    ${art_title}    ${art_img} ${art_body} ${source_url}
    

Create Latest Artikel popmama to file
    [Arguments]    ${art_title}

Read Last Artikel Updated in file
    [Return]    ${art_title}


