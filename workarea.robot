test_rulebase_with_extCount_AND_segment_OR_score_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count && segment || score"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=1    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    scoreAttr=${attr_score}    expression=1&&2||3
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list    106    107    108    109    110
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_AND_segment_AND_score_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count && segment && score"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=1    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    scoreAttr=${attr_score}    expression=1&&2&&3
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_OR_segment_AND_score_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count && segment && score"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=1    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    scoreAttr=${attr_score}    expression=1||2&&3
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list    106    107    108    109    110
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href


test_rulebase_with_extCount_OR_segment_OR_score_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count && segment && score"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=1    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    scoreAttr=${attr_score}    expression=1||2||3
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list    106    107    108    109    110
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href



test_rulebase_with_extCount_AND_segment_OR_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count && segment || visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=3
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    expression=1&&2||3
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_OR_segment_OR_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count || segment || visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=3
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    expression=1||2||3
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list    106    107    108    109    110
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_AND_segment_AND_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count && segment && visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=3
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    expression=1&&2&&3
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_OR_segment_AND_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count || segment && visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=3
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    expression=1||2||3
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list    106    107    108    109    110
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_OR_segment_OR_score_OR_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count || segment || score || visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=15    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=4
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    scoreAttr=${attr_score}    expression=1||2||3||4
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list    106    107    108    109    110
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_AND_segment_OR_score_OR_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count && segment || score || visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=15    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=4
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    scoreAttr=${attr_score}    expression=1&&2||3||4
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_OR_segment_AND_score_OR_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count || segment && score || visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=15    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=4
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    scoreAttr=${attr_score}    expression=1||2&&3||4
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list    106    107    108    109    110
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_AND_segment_AND_score_OR_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count && segment && score || visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=15    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=4
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    scoreAttr=${attr_score}    expression=1&&2&&3||4
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_OR_segment_OR_score_AND_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count || segment || score && visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=15    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=4
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    scoreAttr=${attr_score}    expression=1||2||3&&4
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list    106    107    108    109    110
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_AND_segment_OR_score_AND_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count && segment || score && visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=15    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=4
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    scoreAttr=${attr_score}    expression=1&&2||3&&4
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_OR_segment_AND_score_AND_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count || segment && score && visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=15    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=4
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    scoreAttr=${attr_score}    expression=1||2&&3&&4
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list    106    107    108    109    110
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href

test_rulebase_with_extCount_AND_segment_AND_score_AND_visit_AND_effective_duration
    [Documentation]    測試 rulebase 型態, rule 為 "ext count && segment && score && visit"
    ${login_response}=    login    ${USER_NAME}    ${PASSWORD}    ${ROLE}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    itemGroupName=${None}    visit=${None}    memberAttrs=${None}    dateAttr=${None}    scoreAttr=${None}    namelist=${None}
    ${TagManager_list}=    rec_getTagManager    ${login_response}    ${SITE1}
    ${Contractor_allsite}=    get_element    ${login_response}    input_name=${None}    icem_name_param=${None}    icem_id_param=owningSiteList    get_what=get_owningSiteList
    ${tagId}=    get_element    ${TagManager_list}    input_name=${None}    icem_name_param=${None}    icem_id_param=id    get_what=get_tagManagerId
    ${siteId}=    get_siteId    ${Contractor_allsite}    ${SITE1}
    ${attr_extCount}=    Create Dictionary    memberCustomAttrName=ext count    extDimensionName=${extDimensionName}    extDimensionOperator=EQUAL    extDimensionValue=${extDimensionValue}    trackType=IMPRESSION    operator=GREATER_OR_EQUAL    memberCustomAttrValue=1    index=1
    ${memberAttrs}    Create List    ${attr_extCount}
    ${all_namelists}=    cam_get_seg_AdssegmentReport    ${login_response}    ${SITE1}
    ${fileName}=    get_seg_namelist    ${all_namelists}    ruleName=${seg_ruleName_1}
    ${segment_list}=    Create Dictionary    fileName=${fileName}    index=2
    ${attr_score}=    Create Dictionary    scoreRuleName=${score_rule_name}    score=15    scoreOperator=GREATER_OR_EQUAL    percent=${None}    percentOperator=${None}    ranking=${None}    rankingOperator=${None}    index=3
    ${visit}    Create Dictionary    clickNum=10    clickOperator=GREATER_OR_EQUAL    impressionNum=150    impressionOperator=LESS_THAN    recencyNum=1    recencyOperator=LESS_OR_EQUAL    index=4
    ${time}=    generate_time    ${log_cost_day}
    ${date}=    timetransfer_time_into_date    ${time}
    ${date}=    Get Substring    ${date}    0    10
    ${dateAttr}    Create Dictionary    startDate=2016-06-01    endDate=${date}    fromHour=${None}    toHour=${None}
    rec_edit_Configuration_Rule    ${login_response}    ${SITE1}    ${rec_rulebase_ext}    r1    contentName=${rec_content1}    itemGroupName=${rec_items_default}    memberAttrs=${memberAttrs}    dateAttr=${dateAttr}    namelist=${segment_list}    visit=${visit}    scoreAttr=${attr_score}    expression=1&&2&&3&&4
    ${results}=    get_rec_multiQuery_results    ${siteId}    ${tagId}    domId=rec_rule1    retUid=${hard_retUid}
    ${check_itemlist}=    Create list
    check_rec_multiQuery_results    ${results}    ${check_itemlist}    check_content=href