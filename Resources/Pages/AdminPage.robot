*** Keywords ***
Click Save Draft
    Scroll Element Into View        id=save-post
    CLick Element        id=save-post

Input Article title
    [Arguments]    ${title}=sample
    Input Text            id=title                ${title}

Input Article Body
    [Arguments]    ${article_data}=sample
    Input Text            id=content                ${article_data}


Input New Article
    [Arguments]    ${art_title}=data1    ${art_body}=body1
    Input Article title    ${art_title}
    Input Article Body    ${art_body}
    Click Save Draft
    sleep   3

