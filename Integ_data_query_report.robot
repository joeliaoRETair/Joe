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
${USER_NAME}    joe
${PASSWORD}    retair
${ROLE}    contr
${SITE1}    site
${CONTR_loginId}    joe

#------
${pixel_name}    pixel
${log_cost_day}    0

#------ Member ------#
${member1}    member1
${member2}    member2
${member3}    member3

#------ param setting ------#

${query_key_1}    age
${query_key_2}    gender
${query_key_3}    interests
${query_key_4}    country,county

${query_value_1}    20
${query_value_2}    Female
${query_value_3}    reading
${query_value_4}    Unknown,Unknown

#--- member 1 ---#
${member1_param1}    age=27
${member1_param2}    gender=Male
${member1_param3}    interests=running
${member1_param4}    ip=121.114.250.212
${mb1_log_times}    5

#--- member 2 ---#
${member2_param1}    age=20
${member2_param2}    gender=Female
${member2_param3}    interests=reading
${member2_param4}    ip=14.32.176.176

${mb2_log_times}    6
#--- member 3 ---#
${member3_param1}    age=22
${member3_param2}    gender=Female
${member3_param3}    interests=tennis
${member3_param4}    ip=140.114.123.111

${mb3_log_times}    7
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

#------ container tag setting ------#
${rec_outlink}   http://rec-outlink-cantainer.com/
${rec_referer}    http://rec-referer-cantainer.com/
${member_track1_taiwan1}      track1_taiwan1
${hard_retUid_tracking1}    159_retuid_tracking1_1

#------event tag setting ------
${event_tag_name}    event_tag

${eventag_outlink1-1}   http://eventag-OUT1-1-magicryze-wixsite.com/html/331abdbdd9.html
${eventag_referer1-1}    http://eventag-referer1-1.retchat.com/QAtracking_site12/011.html

${member_event_tag}    event_tag
${eventtag_retuid_web}   159_eventag_1_retuid_web

#---------------------------------------------------offsite   pixel---------------------

#-------------pixel 10-----------------
${pixel10_name}    Pixel10-test
${pixel_outlink1-1}   http://pixel-OUT1-1-magicryze-wixsite.com/html/331abdbdd9.html
${pixel_referer1-1}    http://pixel-referer1-1.retchat.com/QAtracking_site12/011.html


${member_pixel10_1}    pixel10_1
${pixel10-1_retuid_web}   159_pixel10_1_retuid_web
${cat_range_Pixel-test10-1}      11
${catclk_range_Pixel-test10-1}      11
${catcv_range_Pixel-test10-1}    11
${visitors-range_Pixel-test10-1}   11

${app}    WEB

*** Test Cases ***
Add_New_Contractor
   [Documentation]  預先新增contractor
    ${login_response}=    login    ${admin_NAME}    ${admin_PASSWORD}    ${admin_ROLE}
    set_contractor    ${login_response}    ${CONTR_loginId}    joe@mail.com    ${CONTR_loginId}


Add_contractor_site
    [Documentation]  預先新增site
    ${login_response}=    login    ${admin_NAME}    ${admin_PASSWORD}    ${admin_ROLE}
    contractor_site_add    ${login_response}    ${USER_NAME}    ${SITE1}    http://www.tonylin1.idv.tw/dokuwiki/do.php    192.168.5.10


Reset_Contractor_Password
    [Documentation]  reset  password
    ${login_response}=    login    ${admin_NAME}    ${admin_PASSWORD}    ${admin_ROLE}
    ${reset_password}=    contractor reset password    ${login_response}    ${CONTR_loginId}
    ${login_response}=    login    ${USER_NAME}    ${reset_password}    contr
    USER_reset_password_new    ${login_response}    ${reset_password}    ${PASSWORD}    ${PASSWORD}

add_member
    [Documentation]  add member
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
     member_add    ${login_response}    ${SITE1}    joe    joe    09123456789  test@gmail.com     0     0


Add_pixel
     [Documentation]  添加 cat , catcv , catclk 類型
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    cam_add_pixel    ${login_response}    ${SITE1}    campaign=${pixel_name}    ad=testad    group=testgroup    pixelpayload=no


Input_container_tag_tracking_log
    [Documentation]  input container tag tracking log
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList     get_what=get_owningSiteList
    ${site_id}    get_siteID    ${contractor_allsite}    ${SITE1}
    ${tag_resp}    rec_getSnippetCode    ${login_response}    ${SITE1}

    ${fromOutLink}    convert to string    http://rec-outlink-container.com

    ${useragent_list}    Create List    ${windows_IE}    ${windows_chrome}    ${windows_opera}    ${windows_firefox}    ${mobile_opera_windows}    ${mac_firefox}    ${mobile_IE}    ${mobile_android_chrome}    ${mobile_ios_iphone_chrome}    ${mobile_ios_ipad_chrome}

    #--------- 打 member 1 的 log 5 次 ----------#
    ${param}    convert to string    ${member1_param4}&${member1_param2}&${member1_param3}&${member1_param1}
    :FOR    ${page}    IN RANGE   0   ${mb1_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${test_name}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_tracking    ${time}    ${site_id}    ${hard_retCrt}    ${test_name}    ${sessionId}    fromOutLink=${fromOutLink}    param=${param}   app=WEB    User_Agent=${useragent_list[${random}]}

    #--------- 打 member 2 的 log 6 次 ----------#
    ${param2}    convert to string    ${member2_param4}&${member2_param2}&${member2_param3}&${member2_param1}
    :FOR    ${page}    IN RANGE    0    ${mb2_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${test_name}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_tracking    ${time}    ${site_id}    ${hard_retCrt}    ${test_name}    ${sessionId}    fromOutLink=${fromOutLink}    param=${param}   app=WEB    User_Agent=${useragent_list[${random}]}

    #--------- 打 member 3 的 log 7 次 ----------#
    ${param3}    convert to string    ${member3_param4}&${member3_param2}&${member3_param3}&${member3_param1}
    :FOR    ${page}    IN RANGE    0    ${mb3_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${test_name}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_tracking    ${time}    ${site_id}    ${hard_retCrt}    ${test_name}    ${sessionId}    fromOutLink=${fromOutLink}    param=${param}   app=WEB    User_Agent=${useragent_list[${random}]}


Input_event_tag_tracking_log
    [Documentation]  input event tag tracking log
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList     get_what=get_owningSiteList
    ${site_id}    get_siteID    ${contractor_allsite}    ${SITE1}

    ${pixel_name}    Convert To String    ${event_tag_name}
    ${icem_pixel_resp} =   rec_get_TagPixelbyTagId   ${login_response}   ${SITE1}     ${pixel_name}
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")

    ${sitetype}=    Convert To String     t
    ${fromOutLink}    convert to string    http://rec-outlink-eventtag.com

    ${useragent_list}    Create List    ${windows_IE}    ${windows_chrome}    ${windows_opera}    ${windows_firefox}    ${mobile_opera_windows}    ${mac_firefox}    ${mobile_IE}    ${mobile_android_chrome}    ${mobile_ios_iphone_chrome}    ${mobile_ios_ipad_chrome}

    #--------- 打 member 1 的 log 5 次 ----------#
    ${param1}    convert to string    ${member1_param4}&${member1_param2}&${member1_param3}&${member1_param1}
    :FOR    ${page}    IN RANGE   0   ${mb1_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${test_name}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${test_name}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${pixel_referer}    param=${param1}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}
    #--------- 打 member 2 的 log 6 次 ----------#
    ${param2}    convert to string    ${member2_param4}&${member2_param2}&${member2_param3}&${member2_param1}
    :FOR    ${page}    IN RANGE    0    ${mb2_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${test_name}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${test_name}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${pixel_referer}    param=${param}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}
    #--------- 打 member 3 的 log 7 次 ----------#
    ${param3}    convert to string    ${member3_param4}&${member3_param2}&${member3_param3}&${member3_param1}
    :FOR    ${page}    IN RANGE    0    ${mb3_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${test_name}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${test_name}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${pixel_referer}    param=${param}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}


Input_campaign_pixel_tracking_log
    [Documentation]  input campaign pixel tracking log
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList     get_what=get_owningSiteList
    ${site_id}    get_siteID    ${contractor_allsite}    ${SITE1}

    ${pixel_name}    Convert To String    ${pixel_name}
    ${icem_pixel_resp} =   rec_get_TagPixelbyTagId   ${login_response}   ${SITE1}     ${pixel_name}
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")

    ${sitetype}=    Convert To String     p
    ${fromOutLink}    convert to string    http://rec-outlink-campaign.com

    ${useragent_list}    Create List    ${windows_IE}    ${windows_chrome}    ${windows_opera}    ${windows_firefox}    ${mobile_opera_windows}    ${mac_firefox}    ${mobile_IE}    ${mobile_android_chrome}    ${mobile_ios_iphone_chrome}    ${mobile_ios_ipad_chrome}

    #--------- 打 member 1 的 log 5 次 ----------#
    ${param1}    convert to string    ${member1_param4}&${member1_param2}&${member1_param3}&${member1_param1}
    :FOR    ${page}    IN RANGE   0   ${mb1_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${test_name}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${test_name}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${pixel_referer}    param=${param1}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}
    #--------- 打 member 2 的 log 6 次 ----------#
    ${param2}    convert to string    ${member2_param4}&${member2_param2}&${member2_param3}&${member2_param1}
    :FOR    ${page}    IN RANGE    0    ${mb2_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${test_name}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${test_name}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${pixel_referer}    param=${param}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}
    #--------- 打 member 3 的 log 7 次 ----------#
    ${param3}    convert to string    ${member3_param4}&${member3_param2}&${member3_param3}&${member3_param1}
    :FOR    ${page}    IN RANGE    0    ${mb3_log_times}
       \    ${sessionId}=    generate_sessionId
       \    ${time}=    generate_time    ${log_cost_day}
       \    ${test_name}=    generate_retuid
       \    ${hard_retCrt}    get_tag_retCert    ${tag_resp}
       \    ${random}=    Generate Random String    1    [NUMBERS]
       \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    ${test_name}    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${pixel_referer}    param=${param}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=${sitetype}


test2
    [Documentation]  input campaign pixel log
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList     get_what=get_owningSiteList
    ${site_id}    get_siteID    ${contractor_allsite}    ${SITE1}
    ${tag_resp}    rec_getSnippetCode    ${login_response}    ${SITE1}

    ${fromOutLink}    convert to string    http://rec-OUT1-1-magicryze-wixsite.com

    ${useragent_list}    Create List       ${windows_IE}    ${windows_chrome}     ${windows_opera}    ${windows_firefox}    ${mobile_opera_windows}   ${mac_firefox}    ${mobile_IE}  ${mobile_android_chrome}    ${mobile_ios_iphone_chrome}   ${mobile_ios_ipad_chrome}

    ${param}    convert to string    ${member2_param4}&${member2_param2}&${member2_param3}&${member2_param1}

    ${pixel_referer}    convert to string    http://pixel-referer1-1.retchat.com/QAtracking_site12/011.html

    ${icem_pixel_list}=    cam_get_pixel_list   ${login_response}   ${SITE1}      ${pixel_name}
    ${icem_pixel_resp}=    get_icem_dic_resp    ${icem_pixel_list}    ${pixel_name}    campaign    get_what=get_campaign_pixel
    ${pixel_cat_cert}=    transfer_pixel_data   ${icem_pixel_resp}    campixelbutton=ON
    ${pixelid}=    evaluate    $pixel_cat_cert.get("pixelid")
    ${cert}=    evaluate    $pixel_cat_cert.get("cert")

    ${pixel_type}    Convert To String    cat
    :FOR    ${page}    IN RANGE    0    5
        \    ${time}=    generate_time    ${log_cost_day}
        \    ${sessionId}=    generate_sessionId
        \    ${random}=    Generate Random String    1    [NUMBERS]
        \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    UID    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${pixel_referer}    param=${param}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=p

    ${pixel_type}    Convert To String    catclk
    :FOR    ${page}    IN RANGE    0    5
        \    ${time}=    generate_time    ${log_cost_day}
        \    ${sessionId}=    generate_sessionId
        \    ${random}=    Generate Random String    1    [NUMBERS]
        \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    UID    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${pixel_referer}    param=${param}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=p

    ${pixel_type}    Convert To String    catcv
    :FOR    ${page}    IN RANGE    0    5
        \    ${time}=    generate_time    ${log_cost_day}
        \    ${sessionId}=    generate_sessionId
        \    ${random}=    Generate Random String    1    [NUMBERS]
        \    track_pixel    ${time}    ${site_id}    ${pixel_type}    ${pixelid}    ${cert}    UID    ${sessionId}    fromOutLink=${fromOutLink}    Referer=${pixel_referer}    param=${param}    app=${app}    User_Agent=${useragent_list[${random}]}    sitetype=p


#input_campaign_pixel_log
#    [Documentation]   打入 campaign pixel log
#    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
#    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
#    ${site_id}=    get_siteId      ${Contractor_allsite}    ${SITE1}
#
#    ${param}    Convert To String    ${param4}&${param2}&${param3}&${param1}
#    ${pixel_name}    Convert To String    ${event_tag_name}
#    ${icem_pixel_resp} =   rec_get_TagPixelbyTagId   ${login_response}   ${SITE1}     ${pixel_name}
#    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}
#    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
#    ${cert}=   evaluate  $pixel_cat_cert.get("cert")
#    ${random}=    Generate Random String  1   [NUMBERS]
#
#    ${sitetype}=     Convert To String    t
#
#
#    #------------------------------app : web ----------------------------------------------------
#    ${app}   Convert To String   ${app}
#
#    ${hard_retUid}=   Convert To String   ${eventtag10-1_retuid_web}
#    ${sessionId}=    generate_sessionId
#
#    ${fromOutLink}=    encoded_url     ${eventag_outlink1-1}
#    ${referer}=   encoded_url    ${eventag_outlink1-1}
#    #-----------cat--------
#    ${pixel_type}=  Convert To String    cat
#    :FOR    ${page}    IN RANGE    0   ${cat_range_Pixel}
#        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
#        #track_pixel(self, host, t, siteId,pixeltype, cat,cert,  retUid=None, sessionId='testsessionId',fromOutLink=None, Referer=None,param='googleid=987qwe')
#        \  track_pixel   ${yester_time}   ${site_id}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}    fromOutLink=${fromOutLink}   Referer=${referer}     param=${param}   app=${app}         sitetype=${sitetype}
#    sleep  5
#
#    #-----------catclk--------
#    ${pixel_type}=  Convert To String    catclk
#    :FOR    ${page}    IN RANGE    0   ${catclk_range_Pixel}
#        \  ${yester_time}=   generate_time  ${log1_cost_day}    #yesterday  time
#        #track_pixel(self, host, t, siteId,pixeltype, cat,cert,  retUid=None, sessionId='testsessionId',fromOutLink=None, Referer=None,param='googleid=987qwe')
#        \  track_pixel   ${yester_time}   ${site_id}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}    fromOutLink=${fromOutLink}   Referer=${referer}    param=${param}       app=${app}    User_Agent=    sitetype=${sitetype}
#    sleep  5
#
#    #-----------catcv--------
#    ${pixel_type}=  Convert To String    catcv
#    :FOR    ${page}    IN RANGE    0    ${catcv_range_Pixel}
#        \    ${time}=   generate_time  ${log1_cost_day}    #yesterday  time
#        #track_pixel(self, host, t, siteId,pixeltype, cat,cert,  retUid=None, sessionId='testsessionId',fromOutLink=None, Referer=None,param='googleid=987qwe')
#        \    track_pixel   ${yester_time}   ${site_id}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}   fromOutLink=${fromOutLink}   Referer=${referer}    param=${param}       app=${app}     sitetype=${sitetype}
#
#    #----------not_clicked--------------
#    ${pixel_type}=  Convert To String    cat
#    :FOR    ${page}    IN RANGE    0    ${cat_range_Pixel_noeffective}
#        \  ${sessionId}=    generate_sessionId
#        \    ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
#        #track_pixel(self, host, t, siteId,pixeltype, cat,cert,  retUid=None, sessionId='testsessionId',fromOutLink=None, Referer=None,param='googleid=987qwe')
#        \    track_pixel   ${yester_time}   ${site_id}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}     fromOutLink=${fromOutLink}   Referer=${referer}    param=${param}   app=${app}        sitetype=${sitetype}
#    sleep  5

run_cassandra
    [Documentation]  run hourly cassandra
    integrated_run_hourly_cassandra

test3
    [Documentation]   test
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList

    ${query_key_1}    create list    ${query_key_1}
    ${query_key_2}    create list    ${query_key_2}
    ${query_key_3}    create list    ${query_key_3}

    ${query_value_1}    create list    ${query_value_1}
    ${query_value_2}    create list    ${query_value_2}
    ${query_value_3}    create list    ${query_value_3}

    ${dictionary1}    create dictionary    keys=${query_key_1}    values=${query_value_1}
    ${dictionary1}    convert to dictionary    ${dictionary1}

    ${dictionary2}    create dictionary    keys=${query_key_2}    values=${query_value_2}
    ${dictionary2}    convert to dictionary    ${dictionary2}

    ${dictionary3}    create dictionary    keys=${query_key_3}    values=${query_value_3}
    ${dictionary3}    convert to dictionary    ${dictionary3}

    ${list}    create list    ${dictionary1}    ${dictionary2}    ${dictionary3}
    ${query_report_response}    get_query_with_dimension_filters    ${login_response}    ${SITE1}    dimensions=${list}    start_time=20180308    end_time=20180309    tag_type=0
    ${num}    evaluate    5
    ${res}    get_icem_dic_resp    ${query_report_response}    response    content