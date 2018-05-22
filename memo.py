    def get(self,login_response, site_name):
        total = ''
        for x in range(1 , 138):
            campaign = 'campixel'+str(x)+'-ads_group'+str(x)+'-ads'+str(x)
            cam = self.rec_get_TagPixelbyTagId(login_response,site_name,campaign)
            cam2 =  ICEM_tracking().transfer_pixel_data(cam)
            key = cam2["pixelid"]
            value = cam2["cert"]
            total =  total + ","+"\n" +'"' + key + '":"' + value + '"'
        print "{" + total + "}"
        return