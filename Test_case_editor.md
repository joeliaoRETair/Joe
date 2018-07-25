## __DMP-3024 Retclub - Sending share event in webpage__

## Summary:測試新增 Enable tracking share 的 Page 
Step acrion:
1. Add Pages,每個Page Type都做一次  
(Custom,Questionnaire,Award point,Registraction,Personalized,Hot sales,Ranking,Reminder,Product Detail)  
2. Enable tracking share  
![enable](/testlink/wiki-testcase/Images/Social_Media/DMP-3024/enable_tracking_share.PNG)
3. Save and Publish

>預期結果:Page新增成功  
>實際結果:與預期結果相同

4. 進入Event Management -> Event Tag
5. 檢查是否有新增Event tag: RETCLUB-SHARE-{page名稱}  
EX:RETCLUB-SHARE-註冊頁面

>預期結果:Event tag新增成功  
>實際結果:與預期結果相同

6. 進入DIY Labeling ->DIY Labeling List
7. 檢查是否有新增Ext param:{wx-source,wx-user,wx-action}

>預期結果:Ext param新增成功  
>實際結果:與預期結果相同

## Summary:測試編輯 Page : Disable tracking share -> Enable tracking share 
Step acrion:
1. Add Pages,每個Page Type都做一次 
2. Disable tracking share
3. Save and Publish

>預期結果:Page新增成功  
>實際結果:與預期結果相同

4. 檢查Event Management -> Event Tag 中有沒有新增Event tag

>預期結果:沒有新增 Event tag  
>實際結果:與預期結果相同

5. 檢查DIY Labeling Lsit 有沒有新增 Ext param

>預期結果:沒有新增 Ext param 
>實際結果:與預期結果相同

6. Edit Pages,每個Page Type都做一次  
7. 更改 Disable tracking share -> Enable tracking share  
8. Save and Publish

>預期結果:Page編輯成功  
>實際結果:與預期結果相同

9. 進入Event Management -> Event Tag
10. 檢查是否有新增Event tag: RETCLUB-SHARE-{page名稱}  
EX:RETCLUB-SHARE-註冊頁面

>預期結果:Event tag新增成功  
>實際結果:與預期結果相同

11. 進入DIY Labeling ->DIY Labeling List
12. 檢查是否有新增Ext param:{wx-source,wx-user,wx-action}

>預期結果:Ext param新增成功  
>實際結果:與預期結果相同

## Summary:測試刪除 Enable tracking share 的 Page
>Precondition:Exist enable tracking share Pages   

Step action:
1. Delete Pages
2. 檢查是否成功刪除Pages

>預期結果:Page刪除成功  
>實際結果:與預期結果相同

## Summary:測試新增 Enable tracking share 的 Page Duplicate name 是否跳出錯誤訊息
>Precondition:Exist a enable tracking share Page : testDup  

Step action:
1. Add Page ,Name:testDup ,enable tracking share
2. Save and Publish
3. 檢查是否有 Error:[Page Name] Duplicate is not allowed

>預期結果:新增失敗 且 跳出 Error  
>實際結果:與預期結果相同


## Summary: 測試 Tracking share "分享到朋友圈"是否運作
>Precondition:
1. Exist a custom menu page that DISABLE tracking share  
EX:page name:test
2. Already published this page to wechat

Step action:  

1. 在手機上用 wechat 打開此 page
2. 在電腦 ICEM 進入 Inbound traffic report -> Container tag
3. 檢查 Container tag 的 impression 是否有增加 1

>預期結果: Container tag impression 有增加 1  
>實際結果: 與預期結果相同

4. 進入Social media 編輯這個 Page 為 ENABLE tracking share
5. Save and Publish 然後 publish menu
6. 到手機上的 wechat 點開此 page
7. 點選 "分享到朋友圈"  
![shareToFriend](/testlink/wiki-testcase/Images/Social_Media/DMP-3024/shareToFriend.jpg)
8. 分享完成後,在電腦 ICEM 進入Inbound traffic report -> Event tag
9. 檢查有沒有 Event tag : RETCLUB-SHARE-test 以及這個event tag 的 conversion 是否有增加 1

>預期結果: Event tag conversion 有增加 1  
>實際結果: 與預期結果相同

10. 進入 Event DIY Label Report -> Event Tag : RETCLUB-SHARE-test
PS:下面圖片 wx-source,wx-user 因做了兩次分享  
"分享到朋友圈"以及"傳送給朋友",所以 conversion 為 2
11. 檢查 wx-source 是否有 RETCLUB 且 Conversion 增加 1  
![source](/testlink/wiki-testcase/Images/Social_Media/DMP-3024/source.PNG)
12. 檢查 wx-user 是否有 {open-id} 且 Conversion 增加 1  
PS:圖片中的 oNUgCsziFnuwCkW0LcYfUfO84vfo 為每個人 wechat 的 open id  
![user](/testlink/wiki-testcase/Images/Social_Media/DMP-3024/user.PNG)
13. 檢查 wx-action 是否有 shareTimeLine 且 Conversion 增加 1  
PS:"分享到朋友圈"會是 shareTimeLine  
![action](/testlink/wiki-testcase/Images/Social_Media/DMP-3024/action.PNG)

>預期結果: Event DIY Report conversion 有增加 1  
>實際結果: 與預期結果相同

14. 到手機上的 wechat 點開此 page 
15. 點選 "傳送給朋友"  
![shareToFriend](/testlink/wiki-testcase/Images/Social_Media/DMP-3024/shareToFriend.jpg)
16. 分享完成後,在電腦 ICEM 進入Inbound traffic report -> Event tag 
17. 檢查 Event tag : RETCLUB-SHARE-test conversion 是否有增加 1

>預期結果: Event tag conversion 有增加 1  
>實際結果: 與預期結果相同

18. 檢查 wx-source : RETCLUB Conversion 是否有增加 1  
![source](/testlink/wiki-testcase/Images/Social_Media/DMP-3024/source.PNG)
19. 檢查 wx-user : {open-id} Conversion 是否有增加 1  
PS:圖片中的oNUgCsziFnuwCkW0LcYfUfO84vfo為每個人wechat的open id
![user](/testlink/wiki-testcase/Images/Social_Media/DMP-3024/user.PNG)
20. 檢查 wx-action 是否有 shareAppMessage 且 Conversion 增加 1  
PS:"傳送給朋友"會是 shareAppMessage  
![action](/testlink/wiki-testcase/Images/Social_Media/DMP-3024/action.PNG)

>預期結果: Event tag conversion 有增加 1  
>實際結果: 與預期結果相同

