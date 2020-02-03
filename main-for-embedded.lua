ncovlayout={
  LinearLayout;
  layout_height="fill";
  orientation="vertical";
  layout_width="fill";
  {
    ScrollView;
    layout_height="fill";
    layout_width="fill";
    {
      LinearLayout;
      layout_width="fill";
      orientation="vertical";
      layout_height="fill";
      {
        TextView;
        layout_margin="30dp";
        layout_marginBottom="0";
        text="疑似";
        textSize="21dp";
      };
      {
        TextView;
        id="suspectcount";
        text="加载失败";
        layout_margin="30dp";
        textColor="#FFAE00";
        textSize="45dp";
        layout_marginTop="0";
      };
      {
        TextView;
        layout_marginBottom="0";
        textSize="21dp";
        text="确诊";
        layout_margin="30dp";
        layout_marginTop="0";
      };
      {
        TextView;
        id="confirmcount";
        text="加载失败";
        layout_margin="30dp";
        textColor="#FD5454";
        textSize="45dp";
        layout_marginTop="0";
      };
      {
        TextView;
        layout_marginBottom="0";
        textSize="21dp";
        text="死亡";
        layout_margin="30dp";
        layout_marginTop="0";
      };
      {
        TextView;
        id="deadcount";
        text="加载失败";
        layout_margin="30dp";
        textColor="#343434";
        textSize="45dp";
        layout_marginTop="0";
      };
      {
        TextView;
        layout_marginBottom="0";
        textSize="21dp";
        text="治愈";
        layout_margin="30dp";
        layout_marginTop="0";
      };
      {
        TextView;
        id="curecount";
        text="加载失败";
        layout_margin="30dp";
        textColor="#3DDB86";
        textSize="45dp";
        layout_marginTop="0";
      };
      {
        TextView;
        layout_margin="30dp";
        text=[==[数据来自丁香园
感谢 TankNee 提供的 API]==];
        layout_marginTop="0";
      };
      {
        TextView;
        id="starAPI";
        text="去 GitHub Star 一下 API";
        layout_margin="30dp";
        textColor="#fa82b6";
        textSize="18dp";
        layout_marginTop="0";
      };
      {
        TextView;
        id="gotoBrowser";
        text="前往浏览器查看更多 nCoV 相关内容";
        layout_margin="30dp";
        textColor="#fa82b6";
        textSize="21dp";
        layout_marginTop="0";
      };
    };
  };
};


import "android.app.AlertDialog"
AlertDialog.Builder(activity)
.setTitle("疫情数据")
.setView(loadlayout(ncovlayout))
.show()

import "http"
ncovapi=http.get("https://ncov.neeto.cn/api/")

suminfo=ncovapi:match([[{"sumInfo":(.-),"provinceInfo"]])

confirm=suminfo:match([["confirmedCount":(.-),]])
confirmcount.setText(confirm)

suspected=suminfo:match([["suspectedCount":(.-),]])
suspectcount.setText(suspected)

dead=suminfo:match([["deadCount":(.-),]])
deadcount.setText(dead)

cured=suminfo:match([["curedCount":(.-),]])
curecount.setText(cured)

starAPI.onClick=function()
import "android.content.Intent"
import "android.net.Uri"
viewIntent = Intent("android.intent.action.VIEW",Uri.parse("https://github.com/TankNee/nCoV-2019-DataAPI"))
activity.startActivity(viewIntent)
end

gotoBrowser.onClick=function()
import "android.content.Intent"
import "android.net.Uri"
viewIntent = Intent("android.intent.action.VIEW",Uri.parse("https://ncov.dxy.cn"))
activity.startActivity(viewIntent)
end
