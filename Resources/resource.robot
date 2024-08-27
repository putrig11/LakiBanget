*** Settings ***
Documentation     A resource file with reusable keywords and variables.

Library           SeleniumLibrary
Library           DebugLibrary
Library           OperatingSystem
Library           String
Library            ExtendedSelenium2Library

Resource        ../Resources/Pages/LoginPage.robot
Resource        ../Resources/Pages/AdminPage.robot
Resource        ../Resources/Pages/SooperboyPage.robot
Resource        ../Resources/CommonFunctionality.robot
Resource        ../Resources/Pages/PopmamaPage.robot
Resource        ../Resources/Pages/IdnTimesPage.robot
Resource        ../Resources/Pages/GeneralWebCrawlPage.robot


*** Variables ***
${PATH_Popmama}       ${CURDIR}/popmama.txt
${PATH_Idntimes}      ${CURDIR}/idntimes.txt

${URL}                lakibanget.id
${URL ADMIN}          https://${URL}/wp-admin
${URL ARTIKEL}        ${URL ADMIN}/post-new.php
${BROWSER}            Chrome
${ADMIN USER}         lakibanget.popmama@gmail.com
${ADMIN PASSWORD}     xfpOTuH^8XnVCz9B#6eR&&GU
@{SEARCHITEM}         usera    userb

${DELAY}              0
${SOURCE_ARTICLE}      Popmama
&{Popmama}            
    ...                user_login=lakibanget.popmama@gmail.com
    ...                user_password=xfpOTuH^8XnVCz9B#6eR&&GU
    ...                PATH_Doc=${CURDIR}/popmama.txt
    ...                web_link=https://www.popmama.com/life/relationship
    ...                welcome_screen=xpath=//h2[@class='sub-cat-title']//span[contains(text(),'Relationship')]
    ...                artitem_head=xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item']
    ...                artitem_title=xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item'][%]//div[@class='col-xs-7']//div//a//h3
    ...                art_list_selector=xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item']

&{Popmama_ArticleBody}
    ...                test_article=https://www.popmama.com/life/relationship/fx-dimas-prasetyo/kalimat-mesra-yang-ampuh-merangsang-gairah-istri-saat-bercinta
    ...                body_content=xpath=//div[@id='article-content']
    ...                end_body=xpath=//div[@class='_491z clearfix']
    ...                art_title_sel=xpath=//h1[@class='title']
    ...                art_body_sel=xpath=//div[@id='article-content']
    ...                art_img_sel=xpath=//div[@class='single-cover']//figure//img
    ...                udah_dong=xpath=//button[@class='confirm btn btn-lg btn-length btn-danger']
    ...                mainbanner=xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button 
    ...                show_all=- 


&{IdnTimes}           
    ...                user_login=llakibanget.crawler@outlook.com
    ...                user_password=yK%5Gfog1uAJ2b^sfwB620%^
    ...                PATH_Doc=${CURDIR}/idntimes.txt
    ...                web_link=https://www.idntimes.com/health/sex
    ...                welcome_screen=xpath=//h1[@class='divide-table-cell page-title']
    ...                artitem_head=xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item']
    ...                artitem_title=xpath=//div[@class='box-latest box-list '][%]//div[@class='description-latest box-description']//a//h2
    ...                art_list_selector=xpath=//div[@class='box-latest box-list ']

&{IdnTimes_ArticleBody}
    ...                test_article=https://www.popmama.com/life/relationship/fx-dimas-prasetyo/kalimat-mesra-yang-ampuh-merangsang-gairah-istri-saat-bercinta
    ...                body_content=xpath=//article[@id='article-content']
    ...                end_body=xpath=//span[@class='date']
    ...                art_title_sel=xpath= //h1[@class='title-text']
    ...                art_body_sel=xpath=//article[@id='article-content']
    ...                art_img_sel=xpath=//div[@class='featured-image']//img[1]
    ...                udah_dong=xpath=//div[@class='content-adult ']//ul//li[2]
    ...                mainbanner=xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button 
    ...                show_all=-


&{Stylo}           
    ...                user_login=llakibanget.crawler@outlook.com
    ...                user_password=yK%5Gfog1uAJ2b^sfwB620%^
    ...                PATH_Doc=${CURDIR}/stylo.txt
    ...                web_link=https://stylo.grid.id/love-romance
    ...                welcome_screen=xpath=//h1[@class='mainmenu__title--text']
    ...                artitem_head=xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item']
    ...                artitem_title=xpath=//div[@class='main__content--item clearfix'][%]/div/a[@class='main__content--title']
    ...                art_list_selector=xpath=//h1[@class='mainmenu__title--text']

&{Stylo_ArticleBody}
    ...                test_article=https://www.popmama.com/life/relationship/fx-dimas-prasetyo/kalimat-mesra-yang-ampuh-merangsang-gairah-istri-saat-bercinta
    ...                body_content=xpath=//div[@class='read__right read__article']
    ...                end_body=xpath=//li[@class='active pull-right']
    ...                art_title_sel=xpath=//h1[@class='read__title--text pink']
    ...                art_body_sel=xpath=//div[@class='read__right read__article']
    ...                art_img_sel=xpath=//div[@class='photo photo--main']/div/img
    ...                udah_dong=xpath=//div[@class='content-adult ']//ul//li[2]
    ...                mainbanner=xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button 
    ...                show_all=-


#Skip detik
&{DetikHealth}           
    ...                user_login=llakibanget.crawler@outlook.com
    ...                user_password=yK%5Gfog1uAJ2b^sfwB620%^
    ...                PATH_Doc=${CURDIR}/detik.txt
    ...                web_link=https://health.detik.com/sexual-health
    ...                welcome_screen=xpath=//div[@id='menu']
    ...                artitem_head=xpath=//div[@class='box_text'][1]/h2
    ...                artitem_title=xpath=//div[@class='box_text'][%]/h2
    ...                art_list_selector=xpath=//div[@class='box_text'][1]/h2

&{DetikHealth_ArticleBody}
    ...                test_article=https://www.popmama.com/life/relationship/fx-dimas-prasetyo/kalimat-mesra-yang-ampuh-merangsang-gairah-istri-saat-bercinta
    ...                body_content=xpath=//div[@class='read__right read__article']
    ...                end_body=xpath=//li[@class='active pull-right']
    ...                art_title_sel=xpath=//h1[@class='read__title--text pink']
    ...                art_body_sel=xpath=//div[@class='read__right read__article']
    ...                art_img_sel=xpath=//div[@class='photo photo--main']/div/img
    ...                udah_dong=xpath=//div[@class='content-adult ']//ul//li[2]
    ...                mainbanner=xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button 

&{Kompas}            
    ...                user_login=llakibanget.crawler@outlook.com
    ...                user_password=yK%5Gfog1uAJ2b^sfwB620%^
    ...                PATH_Doc=${CURDIR}/kompas.txt
    ...                web_link=https://lifestyle.kompas.com/feel-good
    ...                welcome_screen=xpath=//h2[@class='row mt2 clearfix']/div[contains(text(),'lifestyle')]
    ...                artitem_head=xpath=//div[@class='post-list'][1]//div[@class='row gutter-20 post-list-item']
    ...                artitem_title=//div[@class='article__list clearfix'][%]//div[@class='article__list__title']/h3/a
    ...                art_list_selector=xpath=//div[@class='article__list__title'][1]/h3/a

&{Kompas_ArticleBody}
    ...                test_article=https://lifestyle.kompas.com/read/2021/04/08/111135120/melihat-jenis-masker-yang-paling-efektif-menangkal-covid-19
    ...                body_content=xpath=//div[@class='col-bs9-7']
    ...                end_body=xpath=//div[@class='col-bs10-1 tag__article__teaser col-offset-0']
    ...                art_title_sel=xpath=//h1[@class='read__title']
    ...                art_body_sel=xpath=//div[@class='col-bs9-7']
    ...                art_img_sel=xpath=//div[@class='photo__wrap']/img
    ...                udah_dong=xpath=//button[@class='confirm btn btn-lg btn-length btn-danger']
    ...                mainbanner=xpath=//div[@id='mainBannerPopup']//div[@class='modal-content'][1]//button  
    ...                show_all=xpath=//div[@class='col-bs12-2 col-offset-0']/a[contains(text(),'Show All')] 

*** Keywords ***