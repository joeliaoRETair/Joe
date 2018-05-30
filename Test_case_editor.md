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
Precondition:Exist enable tracking share Pages   
Step action:
1. Delete Pages
2. 檢查是否成功刪除Pages

>預期結果:Page刪除成功  
>實際結果:與預期結果相同

## Summary:測試新增 Enable tracking share 的 Page Duplicate name 是否跳出錯誤訊息


## Summary: 