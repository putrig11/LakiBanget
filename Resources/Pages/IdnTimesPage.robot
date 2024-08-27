*** Variables ***
${title_onthelist_selector}         xpath=//div[@class='box-latest box-list '][1]//div[@class='description-latest box-description']//a//h2
${art_list_selector} =                    //div[@class='box-latest box-list ']
${art_title_selector} =                 //h1[@class='title-text']
${art_desc_selector} =                   //article[@id='article-content']
${art_img_selector} =                   //div[@class='featured-image']//img[1]
${udah_dong_button} =                   //div[@class='content-adult ']//ul//li[2] 


*** Keywords ***
Update Newest Title idntimes
    [Arguments]         ${latest_arttitle}
    Create File	        ${PATH_Idntimes}	    ${latest_arttitle}
    File Should Exist	${PATH_Idntimes}	

Copy File idntimes
    Copy File	        ${PATH_Idntimes}	~/file.txt
    ${output} =	        Run	    ${TEMPDIR}${/}script.py arg
    log to console      ${output}

Read Latest Artikel title idntimes
    ${last_title}=    Get File  ${PATH_Idntimes}
    [Return]    ${last_title}
    

Read and Compare Artikel title idntimes
    [Arguments]         ${art_title}
    ${File}=    Get File  ${PATH_Idntimes}
    Run Keyword If    '${File}'=='${art_title}'    Log To console    samasdsdsadsd
    ...    ELSE     Log To console    bedasdsdsd

Go To IdnTimes Health
    Go to         https://www.idntimes.com/health/sex
    Wait Until Element Is Visible        xpath=//h3[@class='section-title']//span[contains(text(),'Berita Terkini')]
    #Reload Page

Set New Latest title
    
    

Read List Artikel idntimes Terkini
    #//div[@class='box-latest box-list ']
    ${art_list}=              Set Variable        //div[@class='box-latest box-list ']
    Wait Until Element Is Visible                 xpath=${art_list}
    ${jumlah_artikel}=        Set Variable        ${10}
    ${last_title}=            Read Latest Artikel title idntimes
    ${j}=                     Set Variable        ${1}
    ${newest_title}=          Get Text            ${title_onthelist_selector}
    FOR    ${j}    IN RANGE    ${jumlah_artikel}
        ${j}=    evaluate       ${j}+${1}
        CommonFunctionality.Scroll Element Into View        ${title_onthelist_selector}
        ${art_title}=       Get Text    ${title_onthelist_selector}

        Exit For Loop If    "${last_title}" == "${art_title}"
        Click Element                   ${title_onthelist_selector}
        Log To console        loop halaman j ${j}
        Open Artikel idntimes
        Go To IdnTimes Health


    END

    Update Newest Title    ${newest_title}


Check and Close Udah Dong Button idntimes
    ${button_udahdong}    ${value}=       Run Keyword and Ignore Error    Wait Until Element Is Visible        xpath=udah_dong_button    timeout=2s
    Run Keyword If    '${button_udahdong}'=='PASS'      Click Udah Dong

Click Udah Dong idntimes 
    Wait Until Element Is Visible    xpath=//button[@class='confirm btn btn-lg btn-length btn-danger']    
    Click Element            xpath=//button[@class='confirm btn btn-lg btn-length btn-danger']

Check and close Main Banner Popup idntimes
    ${item}    ${value}=       Run Keyword and Ignore Error    Wait Until Element Is Visible        xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button    timeout=2s
    Run Keyword If    '${item}'=='PASS'      Click Close Main Banner Popup

Click Close Main Banner Popup idntimes
    Wait Until Element Is Visible    xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button
    Click Element                    xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button

Open Artikel idntimes
    sleep    2s

    Check and Close Udah Dong Button idntimes    
    #Check and close Main Banner Popup
    
    ${source_url}       get location

    CommonFunctionality.Scroll Element Into View                 xpath=${art_desc_selector}
    CommonFunctionality.Scroll Element Vertical Into View        //span[@class='date']

    ${art_title}=             Get Text        xpath=${art_title_selector}
    ${art_body}=              Get Text        xpath=${art_bo}
    ${art_img}=               Get Element Attribute        xpath=//div[@class='single-cover']//figure//img        src
       
    
    #Paste To LakiBanget
    Go to       ${URL ADMIN}
    AdminPage.Input New Article    ${art_title}    ${art_img} ${art_body} ${source_url}
    

Create Latest Artikel popmama to file
    [Arguments]    ${art_title}

Read Last Artikel Updated in file
    [Return]    ${art_title}
