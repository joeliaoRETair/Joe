# -*- coding:utf-8 -*-
*** Settings ***
Force Tags    測試 Data query report
Library    ../lib/ICEMRobot.py    ${env}
Library    ../lib/ICEM_tracking.py    ${env}
Library    ../lib/ICEMDatabase.py    ${env}
Library    ../lib/ICEMIntegrated.py    ${env}
Library    String
Library    Collections

*** Variables ***
#------ Admin ------#
${admin_NAME}    admin
${admin_PASSWORD}    retchat1603
${admin_ROLE}    adminrole

#------ User setting ------#
${USER_NAME}    queryreport
${PASSWORD}    123qwe
${ROLE}    contr
${SITE1}    site
${CONTR_loginId}    queryreport

#------

${log_cost_day}    0
${impression_log_times}    5
${click_log_times}    6
${conversion_log_times}    7

#------ Member ------#
${member1}    member1
${member2}    member2
${member3}    member3

#------ recommendation name ------#
${rec_name1}    test_recommendation
${rec_name2}    rec_rulebase
${rec_name3}    rec_item

${rec_content}     pre_rec_content

#------ container tag setting ------#
${rec_DomId}    rec_rule

#------ event tag setting ------
${event_tag_name}    event_tag

#------ campaign pixel ------
${pixel_name}    pixel

#------ param setting ------#

${query_key_1}    age
${query_key_2}    gender
${query_key_3}    interests

#---impression
${query_value_1_imp}    27
${query_value_2_imp}    Male
${query_value_3_imp}    running

#---click
${query_value_1_clk}    20
${query_value_2_clk}    Female
${query_value_3_clk}    reading

#----conversion
${query_value_1_cv}    22
${query_value_2_cv}    Female
${query_value_3_cv}    tennis

#--- member 1 ---#
${member1_param1}    age=27
${member1_param2}    gender=Male
${member1_param3}    interests=running
${member1_param4}    ip=121.114.250.212

#--- member 2 ---#
${member2_param1}    age=20
${member2_param2}    gender=Female
${member2_param3}    interests=reading
${member2_param4}    ip=14.32.176.176

#--- member 3 ---#
${member3_param1}    age=22
${member3_param2}    gender=Female
${member3_param3}    interests=tennis
${member3_param4}    ip=140.114.123.111

#------ User agent setting------#
${windows_IE}    Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko
${windows_chrome}    Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36
${windows_opera}    Opera/9.80 ( Windows NT 6.1) Presto/2.12.388 Version/12.14
${windows_firefox}    Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20120101 Firefox/33.0
${mobile_opera_windows}    Opera/9.80 (W Windows NT 6.1 Presto/2.12.388 Version/12.14;Mobile/7B405 )
${mac_firefox}    Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
${mobile_IE}    Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0)
${mobile_android_chrome}    Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36
${mobile_ios_iphone_chrome}    Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25
${mobile_ios_ipad_chrome}    Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25

${app}    WEB

*** Test Cases ***
add_new_contractor
   [Documentation]  預先新增contractor
    ${login_response}=    login    ${admin_NAME}    ${admin_PASSWORD}    ${admin_ROLE}
    set_contractor    ${login_response}    ${CONTR_loginId}    joe@mail.com    ${CONTR_loginId}


add_contractor_site
    [Documentation]  預先新增site
    ${login_response}=    login    ${admin_NAME}    ${admin_PASSWORD}    ${admin_ROLE}
    contractor_site_add    ${login_response}    ${USER_NAME}    ${SITE1}    http://www.tonylin1.idv.tw/dokuwiki/do.php    192.168.5.10


reset_contractor_password
    [Documentation]  reset  password
    ${login_response}=    login    ${admin_NAME}    ${admin_PASSWORD}    ${admin_ROLE}
    ${reset_password}=    contractor reset password    ${login_response}    ${CONTR_loginId}
    ${login_response}=    login    ${USER_NAME}    ${reset_password}    contr
    USER_reset_password_new    ${login_response}    ${reset_password}    ${PASSWORD}    ${PASSWORD}

add_member
    [Documentation]  add member
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    member_add    ${login_response}    ${SITE1}    ${member1}    ${member1}    09123456789  test@gmail.com    0    0
    member_add    ${login_response}    ${SITE1}    ${member2}    ${member2}    09123456787  test@gmail.com    0    0
    member_add    ${login_response}    ${SITE1}    ${member3}    ${member3}    09123456786  test@gmail.com    0    0


add_items
    [Documentation]   預先新增  item
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    # item_add(self, login_response, siteName, itemcode, name, price, grouping, category ,  startDate, endDate
    item_add    ${login_response}    ${SITE1}    101    可樂    35    飲品    氣泡飲品    2016-07-01    2018-09-01    discount=35
    item_add    ${login_response}    ${SITE1}    102    MP3播放器    699    家電    娛樂    2016-07-01    2018-08-01    discount=699
    item_add    ${login_response}    ${SITE1}    103    舒眠枕頭    3000    家居    寢具    2016-01-20    2018-01-20    discount=3000
    item_add    ${login_response}    ${SITE1}    104    大人巧克力    500    食品    零嘴    2016-03-01    2018-09-01    discount=500
    item_add    ${login_response}    ${SITE1}    105    不沾鍋    21000    家居    廚具    2016-07-01    2018-07-02    discount=21000


add_recommend_content
    [Documentation]  預先新增 recommend content
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${itemId}=  robot_str_plus_str   $    {itemId}
    ${code}=   robot_str_plus_str    $    {code}
    ${name}=   robot_str_plus_str    $    {name}
    add_creative    ${login_response}    ${SITE1}    pre_rec_content    html=<html><a href=http://icem.retair.com:10080.html> 商品id: ${itemId} itemcode :${code} 商品名稱: ${name} </a></html>
    add_creative    ${login_response}    ${SITE1}    test1_rec_content    html=<html>test1 商品id: ${itemId} itemcode :${code} 商品名稱: ${name} </html>
    add_creative    ${login_response}    ${SITE1}    test2_rec_content    html=<html>test2 商品id: ${itemId} itemcode :${code} 商品名稱: ${name} </html>


add_recommendation
    [Documentation]   預先新增 recommendation
     ${login_response}=    login    ${USER_NAME}    ${PASSWORD}     ${ROLE}
    rec_add_Configuration    ${login_response}    ${SITE1}    ${rec_name1}    recommendType=ITEM_AUTO    isLimit=${False}    displayNum=${None}    contentName=pre_rec_content    behaviorType=BROWSING
    rec_add_Configuration    ${login_response}    ${SITE1}    ${rec_name2}    recommendType=ITEM_AUTO    isLimit=${False}    displayNum=${None}    contentName=pre_rec_content    behaviorType=BROWSING
    rec_add_Configuration    ${login_response}    ${SITE1}    ${rec_name3}    recommendType=ITEM_AUTO    isLimit=${False}    displayNum=${None}    contentName=pre_rec_content    behaviorType=BROWSING


add_recommendation_with_rule
     [Documentation]   預先新增  rule
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}   ${ROLE}
    #rec_add_Configuration_Rule(self,login_response,  siteName, confName,ruleName,contentName,itemGroupName=None,ruleMemo=None,visit=None,memberAttrs=None,dateAttr=None,channel_type="WEB",scoreOperator="EQUAL",score=0, scoreRuleName="",check_button ='OFF')
    rec_add_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_name1}    r1    ${rec_content}
    rec_add_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_name2}    r1    ${rec_content}
    rec_add_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_name3}    r1    ${rec_content}

add_recommend_tag
     [Documentation]  新增 Recommend Tag
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${domRulePair}    Create dictionary    rec_rule=${rec_name1}
    rec_add_TagRecommend    ${login_response}    ${SITE1}    tagrecommend    recommendstatus=ON    domRulePair=${domRulePair}


add_pixel
    [Documentation]  add pixel
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    cam_add_pixel    ${login_response}    ${SITE1}    campaign=${pixel_name}    ad=testad    group=testgroup    pixelpayload=no


add_eventag
    [Documentation]  添加 cat , catcv , catclk 類型
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${url_click}    Create list    QA
    ${trvo_click}    Create dictionary    type=PAGE_VIEW_PIXEL_CLICK    urlPatternList=${url_click}
    ${trvo_track}    Create dictionary    type=PAGE_VIEW_PIXEL_TRACK    urlPatternList=${url_click}
    ${trvo_convert}    Create dictionary    type=PAGE_VIEW_PIXEL_CONVERT    urlPatternList=${url_click}
    ${triggerVOList}    Create list    ${trvo_click}    ${trvo_track}    ${trvo_convert}
    rec_add_TagPixel    ${login_response}   ${SITE1}    ${event_tag_name}    label=tagpixelonsite    memo=tagpixelonsite    pixelpayload=no    type=ON_SITE    triggerVOList=${triggerVOList}


input_container_tag_tracking_log
    [Documentation]  input container tag tracking log
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${site_id}    get_siteID    ${contractor_allsite}    ${SITE1}
    ${tag_resp}    rec_getSnippetCode    ${login_response}    ${SITE1}

    ${recommendation_list}=    rec_get_Configuration_list    ${login_response}    ${SITE1}
    ${recommendation_name}    Convert To String    ${rec_name1}
    ${recommendId}=    get_element    ${recommendation_list}    ${recommendation_name}    name    id    get_recommendationId

    ${fromOutLink}    convert to string    http://rec-outlink-container.com
    ${referrer}    convert to string    http://rec-referrer-container.com
    ${useragent_list}    Create List    ${windows_IE}    ${windows_chrome}    ${windows_opera}    ${windows_firefox}    ${mobile_opera_windows}    ${mac_firefox}    ${mobile_IE}    ${mobile_android_chrome}    ${mobile_ios_iphone_chrome}    ${mobile_ios_ipad_chrome}

    #--------- 打 member 1 的 cat log 5 次 ----------#
    ${param}    convert to string    ${member1_param4}&${member1_param2}&${member1_param3}&${member1_param1}
    :FOR    ${page}    IN RANGE   0   ${impression_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${retUid}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_retImpr    ${time}     ${site_id}    ${hard_retCrt}    ${retUid}    ${sessionId}     ${member1}    ${rec_DomId}    ${recommendId}    101    Referer=${referrer}    fromOutLink=${fromOutLink}    param=${param}     app=${app}    User_Agent=${useragent_list[${random}]}

    sleep    10
    #--------- 打 member 2 的 click log 6 次 ----------#
    ${param2}    convert to string    ${member2_param4}&${member2_param2}&${member2_param3}&${member2_param1}
    :FOR    ${page}    IN RANGE    0    ${click_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${retUid}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_retclk    ${time}    ${site_id}    ${hard_retCrt}    ${retUid}    ${sessionId}    ${member2}    ${rec_DomId}    ${recommendId}    102    Referer=${referrer}    fromOutLink=${fromOutLink}    param=${param2}   app=${app}    User_Agent=${useragent_list[${random}]}

    sleep    10

input_event_tag_tracking_log
    [Documentation]  input event tag tracking log
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${site_id}    get_siteID    ${contractor_allsite}    ${SITE1}

    ${pixel_name}    Convert To String    ${event_tag_name}
    ${icem_pixel_resp}=    rec_get_TagPixelbyTagId    ${login_response}    ${SITE1}    ${pixel_name}
    ${pixel_cat_cert}=    transfer_pixel_data    ${icem_pixel_resp}
    ${pixelid}=    evaluate    $pixel_cat_cert.get("pixelid")
    ${cert}=    evaluate    $pixel_cat_cert.get("cert")


    ${sitetype}=    Convert To String     t
    ${fromOutLink}    convert to string    http://rec-outlink-eventtag.com
    ${eventag_referer}    convert to string    http://eventag-referer.retchat.com

    ${useragent_list}    Create List    ${windows_IE}    ${windows_chrome}    ${windows_opera}    ${windows_firefox}    ${mobile_opera_windows}    ${mac_firefox}    ${mobile_IE}    ${mobile_android_chrome}    ${mobile_ios_iphone_chrome}    ${mobile_ios_ipad_chrome}

    #--------- 打 member 1 的 cat log 5 次 ----------#
    ${param1}    convert to string    ${member1_param4}&${member1_param2}&${member1_param3}&${member1_param1}
    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0    ${impression_log_times}
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${sessionId}=    generate_sessionId
       \    ${retUid}=    generate_retuid
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${retUid}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${eventag_referer}    param=${param1}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}

    sleep    10
    #--------- 打 member 2 的 click log 6 次 ----------#
    ${param2}    convert to string    ${member2_param4}&${member2_param2}&${member2_param3}&${member2_param1}
    ${pixel_type}=  Convert To String    catclk
    :FOR    ${page}    IN RANGE    0    ${click_log_times}
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${sessionId}=    generate_sessionId
       \    ${retUid}=    generate_retuid
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${retUid}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${eventag_referer}    param=${param2}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}

    sleep    10
    #--------- 打 member 3 的 catcv log 7 次 ----------#
    ${param3}    convert to string    ${member3_param4}&${member3_param2}&${member3_param3}&${member3_param1}
    ${pixel_type}=  Convert To String    catcv
    :FOR    ${page}    IN RANGE    0    ${conversion_log_times}
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${sessionId}=    generate_sessionId
       \    ${retUid}=    generate_retuid
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${retUid}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${eventag_referer}    param=${param3}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}

    sleep    10

input_campaign_pixel_tracking_log
    [Documentation]  input campaign pixel tracking log
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${site_id}    get_siteID    ${contractor_allsite}    ${SITE1}

    ${pixel}    Convert To String    ${pixel_name}
    ${icem_pixel_resp}=    rec_get_TagPixelbyTagId    ${login_response}    ${SITE1}    ${pixel}
    ${pixel_cat_cert}=    transfer_pixel_data    ${icem_pixel_resp}
    ${pixelid}=    evaluate    $pixel_cat_cert.get("pixelid")
    ${cert}=    evaluate    $pixel_cat_cert.get("cert")

    ${sitetype}=    Convert To String     p
    ${fromOutLink}    convert to string    http://rec-outlink-campaign.com
    ${campaign_referer}    convert to string    http://campaign-referer.retchat.com

    ${useragent_list}    Create List    ${windows_IE}    ${windows_chrome}    ${windows_opera}    ${windows_firefox}    ${mobile_opera_windows}    ${mac_firefox}    ${mobile_IE}    ${mobile_android_chrome}    ${mobile_ios_iphone_chrome}    ${mobile_ios_ipad_chrome}

    #--------- 打 member 1 的 cat log 5 次 ----------#
    ${param1}    convert to string    ${member1_param4}&${member1_param2}&${member1_param3}&${member1_param1}
    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0    ${impression_log_times}
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${sessionId}=    generate_sessionId
       \    ${retUid}=    generate_retuid
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${retUid}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${campaign_referer}    param=${param1}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}

    sleep    10
    #--------- 打 member 2 的 click log 6 次 ----------#
    ${param2}    convert to string    ${member2_param4}&${member2_param2}&${member2_param3}&${member2_param1}
    ${pixel_type}=  Convert To String    catclk
    :FOR    ${page}    IN RANGE    0    ${click_log_times}
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${sessionId}=    generate_sessionId
       \    ${retUid}=    generate_retuid
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${retUid}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${campaign_referer}    param=${param2}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}

    sleep    10
    #--------- 打 member 3 的 catcv log 7 次 ----------#
    ${param3}    convert to string    ${member3_param4}&${member3_param2}&${member3_param3}&${member3_param1}
    ${pixel_type}=  Convert To String    catcv
    :FOR    ${page}    IN RANGE    0    ${conversion_log_times}
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${sessionId}=    generate_sessionId
       \    ${retUid}=    generate_retuid
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${retUid}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${campaign_referer}    param=${param3}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}

    sleep    10


run_cassandra
    [Documentation]  run hourly cassandra
    integrated_run_hourly_cassandra


check_data_query_report_count_container_tag_with_impression
    [Documentation]   check data query report ,Type:container tag , impression count
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList

    ${query_key_1}    create list    ${query_key_1}
    ${query_key_2}    create list    ${query_key_2}
    ${query_key_3}    create list    ${query_key_3}

    ${query_value_1}    create list    ${query_value_1_imp}
    ${query_value_2}    create list    ${query_value_2_imp}
    ${query_value_3}    create list    ${query_value_3_imp}

    ${dictionary1}    create dictionary    keys=${query_key_1}    values=${query_value_1}
    ${dictionary1}    convert to dictionary    ${dictionary1}

    ${dictionary2}    create dictionary    keys=${query_key_2}    values=${query_value_2}
    ${dictionary2}    convert to dictionary    ${dictionary2}

    ${dictionary3}    create dictionary    keys=${query_key_3}    values=${query_value_3}
    ${dictionary3}    convert to dictionary    ${dictionary3}

    ${list}    create list    ${dictionary1}    ${dictionary2}    ${dictionary3}

    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${str_date}=    transfer_date_to_string    ${date}

    ${query_report_response}    get_query_with_dimension_filters    ${login_response}    ${SITE1}    dimensions=${list}    start_time=20180308    end_time=${str_date}    tag_type=0
    ${response_content}    get_element     ${query_report_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=content    get_what=get_content
    ${content_list}    get from list    ${response_content}    0
    ${impression}    get_element    ${content_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=impression    get_what=get_impression
    ${impression_log_times}    evaluate    ${impression_log_times}
    should be equal    ${impression}    ${impression_log_times}


check_data_query_report_count_container_tag_with_click
    [Documentation]   check data query report ,Type:container tag , click count
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList

    ${query_key_1}    create list    ${query_key_1}
    ${query_key_2}    create list    ${query_key_2}
    ${query_key_3}    create list    ${query_key_3}

    ${query_value_1}    create list    ${query_value_1_clk}
    ${query_value_2}    create list    ${query_value_2_clk}
    ${query_value_3}    create list    ${query_value_3_clk}

    ${dictionary1}    create dictionary    keys=${query_key_1}    values=${query_value_1}
    ${dictionary1}    convert to dictionary    ${dictionary1}

    ${dictionary2}    create dictionary    keys=${query_key_2}    values=${query_value_2}
    ${dictionary2}    convert to dictionary    ${dictionary2}

    ${dictionary3}    create dictionary    keys=${query_key_3}    values=${query_value_3}
    ${dictionary3}    convert to dictionary    ${dictionary3}

    ${list}    create list    ${dictionary1}    ${dictionary2}    ${dictionary3}

    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${str_date}=    transfer_date_to_string    ${date}

    ${query_report_response}    get_query_with_dimension_filters    ${login_response}    ${SITE1}    dimensions=${list}    start_time=20180308    end_time=${str_date}    tag_type=0
    ${response_content}    get_element    ${query_report_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=content    get_what=get_content
    ${content_list}    get from list    ${response_content}    0
    ${click}    get_element    ${content_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=click    get_what=get_click
    ${click_log_times}    evaluate    ${click_log_times}
    should be equal    ${click}    ${click_log_times}


check_data_query_report_count_event_tag_with_impression
    [Documentation]   check data query report ,Type:event tag , impression count
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList

    ${query_key_1}    create list    ${query_key_1}
    ${query_key_2}    create list    ${query_key_2}
    ${query_key_3}    create list    ${query_key_3}

    ${query_value_1}    create list    ${query_value_1_imp}
    ${query_value_2}    create list    ${query_value_2_imp}
    ${query_value_3}    create list    ${query_value_3_imp}

    ${dictionary1}    create dictionary    keys=${query_key_1}    values=${query_value_1}
    ${dictionary1}    convert to dictionary    ${dictionary1}

    ${dictionary2}    create dictionary    keys=${query_key_2}    values=${query_value_2}
    ${dictionary2}    convert to dictionary    ${dictionary2}

    ${dictionary3}    create dictionary    keys=${query_key_3}    values=${query_value_3}
    ${dictionary3}    convert to dictionary    ${dictionary3}

    ${list}    create list    ${dictionary1}    ${dictionary2}    ${dictionary3}

    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${str_date}=    transfer_date_to_string    ${date}

    ${query_report_response}    get_query_with_dimension_filters    ${login_response}    ${SITE1}    dimensions=${list}    start_time=20180308    end_time=${str_date}    tag_type=1
    ${response_content}    get_element    ${query_report_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=content    get_what=get_content
    ${content_list}    get from list    ${response_content}    0
    ${impression}    get_element    ${content_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=impression    get_what=get_impression
    ${impression_log_times}    evaluate    ${impression_log_times}
    should be equal    ${impression}    ${impression_log_times}


check_data_query_report_count_event_tag_with_click
    [Documentation]   check data query report ,Type:event tag , click count
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList

    ${query_key_1}    create list    ${query_key_1}
    ${query_key_2}    create list    ${query_key_2}
    ${query_key_3}    create list    ${query_key_3}

    ${query_value_1}    create list    ${query_value_1_clk}
    ${query_value_2}    create list    ${query_value_2_clk}
    ${query_value_3}    create list    ${query_value_3_clk}

    ${dictionary1}    create dictionary    keys=${query_key_1}    values=${query_value_1}
    ${dictionary1}    convert to dictionary    ${dictionary1}

    ${dictionary2}    create dictionary    keys=${query_key_2}    values=${query_value_2}
    ${dictionary2}    convert to dictionary    ${dictionary2}

    ${dictionary3}    create dictionary    keys=${query_key_3}    values=${query_value_3}
    ${dictionary3}    convert to dictionary    ${dictionary3}

    ${list}    create list    ${dictionary1}    ${dictionary2}    ${dictionary3}

    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${str_date}=    transfer_date_to_string    ${date}

    ${query_report_response}    get_query_with_dimension_filters    ${login_response}    ${SITE1}    dimensions=${list}    start_time=20180308    end_time=${str_date}    tag_type=1
    ${response_content}    get_element    ${query_report_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=content    get_what=get_content
    ${content_list}    get from list    ${response_content}    0
    ${click}    get_element    ${content_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=click    get_what=get_click
    ${click_log_times}    evaluate    ${click_log_times}
    should be equal    ${click}    ${click_log_times}

check_data_query_report_count_event_tag_with_conversion
    [Documentation]   check data query report click count ,Type:event tag , conversion count
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList

    ${query_key_1}    create list    ${query_key_1}
    ${query_key_2}    create list    ${query_key_2}
    ${query_key_3}    create list    ${query_key_3}

    ${query_value_1}    create list    ${query_value_1_cv}
    ${query_value_2}    create list    ${query_value_2_cv}
    ${query_value_3}    create list    ${query_value_3_cv}

    ${dictionary1}    create dictionary    keys=${query_key_1}    values=${query_value_1}
    ${dictionary1}    convert to dictionary    ${dictionary1}

    ${dictionary2}    create dictionary    keys=${query_key_2}    values=${query_value_2}
    ${dictionary2}    convert to dictionary    ${dictionary2}

    ${dictionary3}    create dictionary    keys=${query_key_3}    values=${query_value_3}
    ${dictionary3}    convert to dictionary    ${dictionary3}

    ${list}    create list    ${dictionary1}    ${dictionary2}    ${dictionary3}

    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${str_date}=    transfer_date_to_string    ${date}

    ${query_report_response}    get_query_with_dimension_filters    ${login_response}    ${SITE1}    dimensions=${list}    start_time=20180308    end_time=${str_date}    tag_type=1
    ${response_content}    get_element    ${query_report_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=content    get_what=get_content
    ${content_list}    get from list    ${response_content}    0
    ${conversion}    get_element    ${content_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=conversion    get_what=get_conversion
    ${conversion_log_times}    evaluate    ${conversion_log_times}
    should be equal    ${conversion}    ${conversion_log_times}


check_data_query_report_count_campaign_pixel_with_impression
    [Documentation]   check data query report ,Type:campaign pixel , impression count
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList

    ${query_key_1}    create list    ${query_key_1}
    ${query_key_2}    create list    ${query_key_2}
    ${query_key_3}    create list    ${query_key_3}

    ${query_value_1}    create list    ${query_value_1_imp}
    ${query_value_2}    create list    ${query_value_2_imp}
    ${query_value_3}    create list    ${query_value_3_imp}

    ${dictionary1}    create dictionary    keys=${query_key_1}    values=${query_value_1}
    ${dictionary1}    convert to dictionary    ${dictionary1}

    ${dictionary2}    create dictionary    keys=${query_key_2}    values=${query_value_2}
    ${dictionary2}    convert to dictionary    ${dictionary2}

    ${dictionary3}    create dictionary    keys=${query_key_3}    values=${query_value_3}
    ${dictionary3}    convert to dictionary    ${dictionary3}

    ${list}    create list    ${dictionary1}    ${dictionary2}    ${dictionary3}

    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${str_date}=    transfer_date_to_string    ${date}

    ${query_report_response}    get_query_with_dimension_filters    ${login_response}    ${SITE1}    dimensions=${list}    start_time=20180308    end_time=${str_date}    tag_type=2
    ${response_content}    get_element    ${query_report_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=content    get_what=get_content
    ${content_list}    get from list    ${response_content}    0
    ${impression}    get_element    ${content_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=impression    get_what=get_impression
    ${impression_log_times}    evaluate    ${impression_log_times}
    should be equal    ${impression}    ${impression_log_times}


check_data_query_report_count_campaign_pixel_with_click
    [Documentation]   check data query report ,Type:campaign pixel , click count
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList

    ${query_key_1}    create list    ${query_key_1}
    ${query_key_2}    create list    ${query_key_2}
    ${query_key_3}    create list    ${query_key_3}

    ${query_value_1}    create list    ${query_value_1_clk}
    ${query_value_2}    create list    ${query_value_2_clk}
    ${query_value_3}    create list    ${query_value_3_clk}

    ${dictionary1}    create dictionary    keys=${query_key_1}    values=${query_value_1}
    ${dictionary1}    convert to dictionary    ${dictionary1}

    ${dictionary2}    create dictionary    keys=${query_key_2}    values=${query_value_2}
    ${dictionary2}    convert to dictionary    ${dictionary2}

    ${dictionary3}    create dictionary    keys=${query_key_3}    values=${query_value_3}
    ${dictionary3}    convert to dictionary    ${dictionary3}

    ${list}    create list    ${dictionary1}    ${dictionary2}    ${dictionary3}

    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${str_date}=    transfer_date_to_string    ${date}

    ${query_report_response}    get_query_with_dimension_filters    ${login_response}    ${SITE1}    dimensions=${list}    start_time=20180301    end_time=${str_date}    tag_type=2
    ${response_content}    get_element    ${query_report_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=content    get_what=get_content
    ${content_list}    get from list    ${response_content}    0
    ${click}    get_element    ${content_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=click    get_what=get_click
    ${click_log_times}    evaluate    ${click_log_times}
    should be equal    ${click}    ${click_log_times}

check_data_query_report_count_campaign_pixel_with_conversion
    [Documentation]   check data query report click count ,Type:campaign pixel , conversion count
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList

    ${query_key_1}    create list    ${query_key_1}
    ${query_key_2}    create list    ${query_key_2}
    ${query_key_3}    create list    ${query_key_3}

    ${query_value_1}    create list    ${query_value_1_cv}
    ${query_value_2}    create list    ${query_value_2_cv}
    ${query_value_3}    create list    ${query_value_3_cv}

    ${dictionary1}    create dictionary    keys=${query_key_1}    values=${query_value_1}
    ${dictionary1}    convert to dictionary    ${dictionary1}

    ${dictionary2}    create dictionary    keys=${query_key_2}    values=${query_value_2}
    ${dictionary2}    convert to dictionary    ${dictionary2}

    ${dictionary3}    create dictionary    keys=${query_key_3}    values=${query_value_3}
    ${dictionary3}    convert to dictionary    ${dictionary3}

    ${list}    create list    ${dictionary1}    ${dictionary2}    ${dictionary3}

    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${str_date}=    transfer_date_to_string    ${date}

    ${query_report_response}    get_query_with_dimension_filters    ${login_response}    ${SITE1}    dimensions=${list}    start_time=${str_date}    end_time=${str_date}    tag_type=2
    ${response_content}    get_element    ${query_report_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=content    get_what=get_content
    ${content_list}    get from list    ${response_content}    0
    ${conversion}    get_element    ${content_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=conversion    get_what=get_conversion
    ${conversion_log_times}    evaluate    ${conversion_log_times}
    should be equal    ${conversion}    ${conversion_log_times}


test_data_query_report_export_file
    [Documentation]   export file
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList

    ${query_key_1}    create list    ${query_key_1}
    ${query_key_2}    create list    ${query_key_2}
    ${query_key_3}    create list    ${query_key_3}

    ${list}    create list    ${query_key_1}    ${query_key_2}    ${query_key_3}

    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${str_date}=    transfer_date_to_string    ${date}

    get_query_by_day_export_file    ${login_response}    ${SITE1}    dimensions=${list}    start_time=${str_date}    end_time=${str_date}    tag_type=1
