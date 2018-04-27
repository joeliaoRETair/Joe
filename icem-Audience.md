## **__UX: inline page點擊編輯的時候，默認編輯最後點擊的一行__**  
Preconditions:members頁面:test1m,test2,test3資料already exists   
### **__Summary:在members頁面，點擊編輯時，默認編輯最後點擊的一行__**   
Step actions:  
1. 先點擊test1資料的編輯按鈕   
2. 在點擊test2資料的編輯按鈕   
3. 在點擊test3資料的編輯按鈕   

預期結果:預設編輯最後點擊的一行(test3資料)   
實際结果:與預期結果相同  
  

## **__DMP-1564：UI: Dropdown render to slow (bootstrap-select package)__**  
### **__Summary:ICEM系統裡，所有下拉清單，滑鼠懸浮在下拉清單某個選項時，會有淺藍色的顯示__**  
Step actions:  
1. 在Switch site測試  
2. 點擊Site下拉清單，把滑鼠懸浮在下拉清單資料上 

預期結果:Site下拉清單，滑鼠懸浮在某個選項，會有淺藍色的顯示  
實際结果:與預期結果相同  
  

## **__DMP-1880:當左側側邊欄隱藏的情況下，退出，再登錄，ui顯示bug__**  
### **__Summary:icem左側功能表列隱藏之後，再重新登錄是否會保存之前的記錄__**
Step actions:
1. 登入帳號ID:shawn PS:123qwe
2. 把左側的功能表列隱藏 退出帳號重新登錄 查看ICEM左側功能表列狀態  

預期結果:重新登錄之後，左側功能表列是顯示的狀態   
實際结果:與預期結果相同  
  

## **__DMP-1878:UI: Update login failed information for security issue__**  

Preconditions:shawn6帳號已經存在,密碼為123qwe  
### **__Summary:測試icem帳號的重置密碼功能__**  
Step actions:  
1. {original:123qwe 登入shawn6帳號，點擊"resetPassword"  
original:123qwe  
new:123456  
retypeNew：123456}  
2. 點擊"ok"按鈕  

預期結果:密碼重置功能，登入ID:shawn6 PS:123456 登錄成功  
實際结果:與預期結果相同  
      


# **__ Audience __**  



## **__ICEM-33:upload_member (excel or csv)__**  

### **__Summary:批量上傳 Member csv檔 和 excel檔__**	  
Step actions:	  
1. Upload Member by csv	  
2. Upload Member by excel  
3. Configuration-Miscellaneous-Data Sync History 查看是否成功及上傳欄數是否正確  

預期效果:上傳成功。  
實際结果:與預期結果相同  
  

## **__DMP-1899:Update Item when upload a existed Item list file__**  

Preconditions:已存在一個批量上傳的member.xlsx文件  
### **__Summary:在members頁面批量上傳同一個檔兩次，第二次專案是否更新__**   
Step actions:  
1. 點擊"uploadMember" 選定member.xlsx上傳-->上傳成功，彈出正確的提示資訊 再點擊"upload   
2. Member"再選定 member.xlsx文件  

預期結果:彈出正確提示，提示資訊的內容是上傳成功"0"row，頁面更新一次  
實際结果:與預期結果相同  
  

## **__DMP-2516:當member attribute 的資料是使用檔案上傳的方式 則Attribute 是否顯示__**  

Preconditions:已存在一個Audience Tag   
### **__Summary:在members頁面批量上傳一個檔且帶有attribute__**   
Step actions:  
1. 點擊"uploadMember" 選定member.xlsx上傳-->上傳成功，彈出正確的提示資訊   
2. 點擊Attribute Setting 查看SHOW/HIDE及ATTRIBUTE NAME是否正常運作  

預期結果:該attribute可正常的SHOW/HIDE  
實際结果:與預期結果相同  
  

## **__ICEM-53:test_member_changepage__**   

### **__Summary: 檢查 Member 換頁功能__**  
Step actions:  
1. add 40 個 Member  
2. 檢查是否為15個換頁  

預期結果:換頁成功  
實際结果:與預期結果相同  
  

## **__ICEM-9: add_members__**  

### **__Summary: add_members__**  
Step actions:	  
step1 在會員管理介面，按一下保存，提示會員名稱必填(如圖test1)  
step2 添加會員名稱後，按一下保存，提示電話必填（如圖test2）  
step3 在添加電話和郵寄地址後，按一下保存，提示會員帳號必填（如圖test3）  
step4 在添加完會員帳號後，提示，郵寄地址格式不對（如圖test4）  
improvment:  
1 針對上面的操作步驟，應該一次性提示使用者，會員名稱，電話，郵寄地址，會員帳號為必填項目；每次按一下保存，應該提示用戶未 填的所有必填項目   
2 按一下保存按鈕，就應該對使用者所填格式進行校驗（如 郵寄地址的校驗，用戶名是否重複，電話號碼，用戶帳號是否重複的相關校驗）；   
3 在用戶操作新增功能的同時，應該考慮支援鍵盤操作，比如：按一下保存按鈕，可以考慮支援，鍵盤Enter鍵；或者翻頁碼的時候支持左右鍵等   

Step actions:  
Target 1.測試郵箱驗證  
1. 新增 member :  
{Member Name : ""Administrativ-Service""  
Member Phone : ""0185695856""  
Member Email : ""AdminWeb@qqqqq2. com""  
Account : ""Administrative-Service""  
Remain Point : ""0""  
Total Point : ""0""}  
預期結果:無效郵箱驗證不能通過，不能保存。   
實際结果:與預期結果相同  

Target 2.測試電話驗證  
1. 新增 member :  
{Member Name : ""Administrative""  
Member Phone : ""018""  
Member Email : ""AdminWeb@126.com""  
Account : ""Administrative""  
Remain Point : ""0""  
Total Point : ""0""}  
預期結果:低於八位電話號碼不能通過，不能保存。   
實際结果:與預期結果相同  
Bug:郵箱驗證不能匹配每一個字元(已修正)，電話號碼不能低於八位"(未修正)  
  

## **__ICEM-10:edit_members__**  

Preconditions:Member:"Administrative-Service" already exists	  
### **__Summary:測試 Member 編輯功能__**	  
Step actions:  
1. edit Member:"Administrative-Service"  
2. .{Member Name:"Administrative-Service"-->" "(無字元)  
Member Phone : "018532156627"-->" "(無字元)  
Member Email : "AdminWeb@12. com"-->" "(無字元)  
Account : "Administrative-Service"(無法編輯)  
Remain Point : "0"-->" "(無字元)  
Total Point : "0"-->" "(無字元)}  

預期效果:編輯失敗，提示不能為空。  
實際结果:與預期結果相同  


## **__ICEM-51-53:test_members_Different characters__**  

### **__Summary: member 不同字元測試__**  
Step actions:  
Target 1.Japanese  
1. add  
2. {Member Name : "月によると、"  
Member Phone : ""01246886""  
Member Email : ""tyy123@gmail.com""  
Account : "月によると、"  
Remain Point : ""0""  
Total Point : ""0"" }  
3. Save  
預期结果:保存成功  
實際结果:與預期結果相同  

Target 2.Special Symbol  
1. add  
2. {Member Name : "!@#$%^&*()_+|"  
Member Phone : "01246886"  
Member Email : "tyy123@gmail.com"  
Account : "!@#$%^&*()_+|"  
Remain Point : ""0""  
Total Point : ""0"" }  
3. Save  
預期结果:保存成功  
實際结果:與預期結果相同  

Target 3.简体 ,繁體  
1. add  
2. {Member Name : "简体 ,繁體"  
Member Phone : "01246886"  
Member Email : "tyy123@gmail.com"  
Account : "简体 ,繁體"  
Remain Point : ""0""  
Total Point : ""0"" }  
3. Save  
預期结果:保存成功  
實際结果:與預期結果相同  
  

## **__ICEM-40: search_members__**  

Preconditions: ” !@#$%^&*()_+|” already exists   
### **__Summary: members 搜尋功能__**  
Step actions:  
Target 1.search_members_by_account  
1. 包含關鍵字的都要被搜尋到  
2. Search Member Account : " $%^"  
3. Search Success" !@#$%^&*()_+|"  
預期結果:與搜索內容一致。  
實際结果:與預期結果相同  

Target 2.search_members_by_name  
1. 包含關鍵字的都要被搜尋到  
2. Search Member Name " #$%"  
3. Search Success" !@#$%^&*()_+|"  
預期結果:與搜索內容一致。  
實際结果:與預期結果相同  

Target 3.search_members_by_phone  
1.  包含關鍵字的都要被搜尋到"  
2.  Search Member Phone : "12"	  
3.  Search Success ”01246886”  
預期結果:與搜索顯示一致  
實際结果:與預期結果相同  

Target4.  search_members_by_email  
1. 包含關鍵字的都要被搜尋到"  
2. Search Member email : "12"  
3. Search Success ” tyy123@gmail.com”  
預期結果:與搜索顯示一致  
實際结果:與預期結果相同  
  

## **__ICEM-43:test_members_remainpoint_lager_than_totalpoint__**  

Preconditions:Member:"s12"" already exists  
### **__Summary:測試剩餘紅利大於全部紅利__**  
Step actions:	  
1. edit Member:"qwer123"  
2. {Remain Point:"100"  
Total Point:"0" }   
3. Save"  

預期結果:保存失敗  
實際结果:與預期結果相同  
  

## **__DMP-2266:可用及剩餘點數不應該為空值__**  

Preconditions:Member : "s12"" already exists  
### **__Summary:測試可用及剩餘點數不應該為空值__**	  
Step actions:	  
Edit Member : "qwer123"  
Target 1.當remainpoint有值而totalpoint=null  
1. {Remain Point : "100",Total Point : "" }   
2. Save  
預期結果:則totalpoint=remainpoint  
實際结果:與預期結果相同  

Target 2.當remainpoint=null而totalpoint=有值  
1. {Remain Point : " ",Total Point : "100" }   
2. Save  
預期結果: 則remainpoint=0  
實際结果:與預期結果相同  

Target 3.當remainpoint=null而totalpoint=null  
1. {Remain Point : "",Total Point : "" }   
2. Save  
預期結果:則remainpoint=totalpoint=0  
實際结果:與預期結果相同  
  

## **__ICEM-44:test_duplicate_members_account__**  

Preconditions:Member : "ww6" already exists  
### **__Summary:測試新增重複的 Member Account__**	  
Step actions:  
1. add  
2. {Member Name : ""member""  
Member Phone : ""01577742""  
Member Email : ""sdds@126.com""  
Account : ""ww6"" (重複)  
Remain Point : ""0""  
Total Point : ""0"" }  
3. Save

預期效果:保存失敗，提示帳戶不能重複   
實際结果:與預期結果相同      


# **__ Audience Taxonomy __**


## **__DMP-2319_UI -Audience Taxonomy__**   

### **__Summary:測試樹是否能夠正常的新增刪除編輯__**  
Step actions:  
Target 1.create(only for english number chinese)  
1. 右鍵create "01"  
2. save  
3. Audience Tag 自動新增"01" 且Attribute Key 自動選擇"01"  
  Member Attribute 自動新增"01"    
預期結果:如同上述所示  
實際结果:與預期結果相同  

Target 2.create same name Taxonomy  
1. 右鍵create  
2. {Audience Tag Name:01}  
3. save  
4. 同一層再新增節點 {Audience Tag Name:01}  
預期結果:錯誤訊息” Node cannot with the same name”  
實際结果:與預期結果相同  

Target 3.rename  
1. "01"rename"04"  
2. save  
3. Audience Tag Name自動更正"04"  
預期結果:如同上述所示  
實際结果:與預期結果相同  

Target 4.delete  
1. delete"01"  
2. save  
3. Audience Tag同步delete  
預期結果:如同上述所示  
實際结果:與預期結果相同  

Target 5.create 3 層以上的樹  
1. create"01"-"02"-"03"  
2. 左鍵點選任一tag  
3. 跳出提示”Save before you edit”  
預期結果:如同上述所示  
實際结果:與預期結果相同  
  

## **__DMP-2320_Audience Segment will Show Error:illegal_Audience_tag_option_id if Users modify Audience Tag options__**  
Preconditions: Audience Tag, ex:gender, Male/Female already exists  
### **__Summary: 當Audience Segment使用 Audience_tag 後做更動對Segment__**
有何影響  
Step actions:  
1. 使用者在 Audience Segment 裡建立 一個segment ex: male，條件有勾選 gender:Male ，儲存後並執行  
2. 使用者回到 Audience Tag 裡刪掉gender:Male 並重新建立 gender:Male 這個tag  
3. 使用者回到 Audience Segment:male，修改條件後，點擊儲存  

預期結果:儲存成功  
實際结果:與預期結果相同  
  

## **__DMP-2448	Audience Taxonomy 在Option Name 輸入特殊字元 則節點出現特殊字元__**  

### **__Summary: Audience Taxonomy不應該出現特殊字元__**  
Step actions:  
1. 新增一個節點  
2. save  
3. 左鍵點選該節點編輯  
4. 在Option Name輸入特殊字元”!@#$%^&*()_+|”  
5. add option 無法添加  

預期结果:無法添加  
實際结果:與預期結果相同  
  

## **__DMP-2211-2213  ICEM - Support weather,location based,time of date derrived function__**  

### **__Summary:測試Audience Taxonomy all derrived function__**  
Step actions:  
Preconditions: Audience Tag "參考地點" already exists 並輸入一個完整的地址    
Target 1.Location  
1. add  
{Attribute Name:"當前位置"  
Attribute Key:”參考地點”  
Derive Function:Location Calculator  
Option Name :當前位置  
Option Operator :Equal  
Option Value:當前位置}   
(實際資料須將地址輸入資料庫)  
2. save  
預期結果:會自動顯示地址  
實際结果:與預期結果相同  

Target 2.Weather  
1. add  
{Attribute Name:"當前位置的天氣"  
Attribute Key:”參考地點”  
Derive Function: :Weather Calculator  
Option Name : 天氣  
Option Operator :Equal  
Option Value: 天氣 }   
2. save  
預期結果:會自動顯示  
實際结果:與預期結果相同  

Target 3.Temperature  
1. add  
{Attribute Name:"當前位置的溫度"  
Attribute Key:”參考地點”  
Derive Function: : Temperature Calculator  
Option Name :溫度  
Option Operator :Equal  
Option Value:溫度 }   
2. save  
(單位:攝氏)  
預期結果:會自動顯示  
實際结果:與預期結果相同  

Target 4.Hour  
1. add  
{Attribute Name:"當前位置的時區"  
Attribute Key:”參考地點”  
Derive Function: : Hour Calculator  
Option Name :時區  
Option Operator :Equal  
Option Value:時區 }   
2. save  
預期結果:會自動顯示  
實際结果:與預期結果相同  

Target 5.Distance  
1. add  
{Attribute Name:"當前位置與參考地點的距離"  
Attribute Key:”參考地點”  
Derive Function: : Distance Calculator  
Option Name :距離  
Option Operator :Equal  
Option Value:距離 }   
2. save  
(單位:公里)  
預期結果:會自動顯示  
實際结果:與預期結果相同  


Preconditions: memberAttribute "參考日期" already exists 輸入2018-04-01  
Target 6.Day  
1. add  
{Attribute Name:"日"  
Attribute Key:”參考日期”  
Derive Function: : Day Calculator  
Option Name :日  
Option Operator :Equal  
Option Value:日 }   
2. save  
預期結果:會自動顯示  
實際结果:與預期結果相同  

Target 7.Week  
1. add  
{Attribute Name:"週"  
Attribute Key:”參考日期”  
Derive Function: Week Calculator  
Option Name :週  
Option Operator :Equal  
Option Value:週 }   
2. save  
預期結果:會自動顯示  
實際结果:與預期結果相同  

Target 8.Month  
1. add  
{Attribute Name:"月"  
Attribute Key:”參考日期”  
Derive Function: Month Calculator  
Option Name :月  
Option Operator :Equal  
Option Value:月 }   
2. save
預期結果:會自動顯示"4"  
實際结果:與預期結果相同  


Target 9.Year  
1. add  
{Attribute Name:"年"  
Attribute Key:”參考日期”  
Derive Function: Year Calculator  
Option Name:年  
Option Operator :Equal  
Option Value:年 }   
2. save  
預期結果:會自動顯示  
實際结果:與預期結果相同  
  

## **__DMP-2892:Support multiple key-values in audience report__**   

### **__Summary:測試taxonomy tag的isMultiple參數的功能__**

Step actions: 
1. 在頁面Audience -> Audience Taxonomy，設置一個有三層的taxonomy，例如：  
color  
  |__red  
   &#160; &#160; |__true  
  |__yellow  
   &#160; &#160; |__true  
  |__blue  
   &#160; &#160; |__true  
2. 設定一些audience，任意在red、yellow及blue欄位填入符合true設定的屬性值。  
3. 利用api或是修改資料庫的方式，將color的isMultiple參數修改為true。  
4. 於隔日進入Audience Report -> Audience Segment Report頁面，Audience Segment選擇為All Audience Segments並點擊Apply。  
預期結果:color的圖表中，應包含red、yellow及blue，數值應與各audience的相對屬性吻合。  
實際结果:與預期結果相同  

備註： 可參考JIRA DMP-2892的圖片。  
![image](/Audience/2892.png)  
