//<script>
var MainMenu;
var ItemMenu;
var j;
var OutlookLikeBar;

OB_Top=31;//顶边距
OB_Left=3;//左边距
OB_Margin=10;//上下边距
OB_Width=108;//菜单宽
OB_Height=document.body.offsetHeight-67;//菜单高
OB_SlideSpeed=1.75;//移动速度
OB_BackgroundColor="#D6D3CE";//菜单背景
OB_ItemsSpacing=20;//菜单图标与文字距离
OB_BorderWidth=1;//边框宽
OB_BorderStyle="jungle";//边框样式
OB_BorderColor="#DDDDDD";//边框颜色
OB_IconsWidth=32;//图标宽
OB_IconsHeight=32;//图标高
OB_ButtonFontFamily="tahoma";//按钮字体
OB_ButtonFontSize=8;//字体大小  
OB_ButtonFontColor="#000066";//字体颜色     
OB_ButtonHeight=20;//按钮高
OB_LabelFontFamily="tahoma";//菜单字体
OB_LabelFontSize=8;//大小 
OB_LabelFontColor="black";//颜色 
OB_LabelMargin=3;//标签图标商距离 
OB_UpArrow="images/up.gif";//向上图标	
OB_DownArrow="images/down.gif";//向下图标	
OB_ArrowWidth=16;//图标宽
OB_ArrowHeight=16;//图标高
OB_ArrowSlideSpeed=8;//菜单图标移动速度

OutBarFolder1=new Array("通讯录管理","images/ico/ico39.gif","添加通讯信息","addCommunication.mvc","OfficeMain","images/ico/ico38.gif","通讯信息查看","communicationList.mvc","OfficeMain","images/ico/ico11.gif","生日报警","birthdayWarning.mvc","OfficeMain");

OutBarFolder2=new Array("","images/ico/ico29.gif","添加分组","communication/addGroup.asp","OfficeMain","images/ico/ico08.gif","分组管理","communication/groupManage.asp","OfficeMain");

OutBarFolder3=new Array("日程安排管理","images/ico/ico35.gif","添加日程安排","addDayShedule.mvc","OfficeMain","images/ico/ico40.gif","日程安排信息列表","getDaySheduleList.mvc","OfficeMain","images/ico/ico46.gif","日程安排信息报警","getDaySheduleWarning.mvc","OfficeMain");

OutBarFolder4=new Array("系统设置","images/ico/ico08.gif","参数设置","getSystemInfo.mvc","OfficeMain","images/ico/ico00.gif","安全密码设置","password.mvc","OfficeMain");		

OutBarFolder5=new Array("关于系统","images/help.gif","关于系统","about.mvc","OfficeMain");



MainMenu=MainMenu+"<DIV id='OutlookLikeBar' style='position:absolute;top:"+OB_Top+";left:"+OB_Left+";width:"+OB_Width+";height:"+OB_Height+";border:"+OB_BorderWidth+" "+OB_BorderStyle+" "+OB_BorderColor+";background-color:"+OB_BackgroundColor+";z-index:0;visibility:hidden;clip:rect(0,"+OB_Width+","+OB_Height+",0)'>";

MainMenu=MainMenu+"<img onMouseUp='OutlookLikeBar.ArrowSelected(this)' onMouseDown='OutlookLikeBar.ArrowClicked(this)' onMouseOver='OutlookLikeBar.OverArrow(this)' onMouseOut='OutlookLikeBar.OutArrow(this)' id='OB_SlideUp' height='"+OB_ArrowHeight+"' width='"+OB_ArrowWidth+"'  src='"+OB_UpArrow+"'style='position:absolute;top:0;left:0;cursor:hand;visibility:hidden;z-index:500'>";

MainMenu=MainMenu+"<img onMouseUp='OutlookLikeBar.ArrowSelected(this)' onMouseDown='OutlookLikeBar.ArrowClicked(this)' onMouseOver='OutlookLikeBar.OverArrow(this)' onMouseOut='OutlookLikeBar.OutArrow(this)' id='OB_SlideDown' height='"+OB_ArrowHeight+"' width='"+OB_ArrowWidth+"' src='"+OB_DownArrow+"' style='position:absolute;top:0;left:0;cursor:hand;visibility:hidden;z-index:500'>";


function ListMenu(){
ItemMenu="";
var m;

j=arguments.length+1;

i=j-1;

while(i>0)
{
m=arguments[i-1];
	Folder=eval("OutBarFolder"+m)
	//window.status="Outlook-Like Bar is making folder '"+Folder[0]+"'";
	if(i==1)
	{
		ItemMenu=ItemMenu+"<INPUT position='UP' id='OB_Button1' onDblClick='OutlookLikeBar.FolderClicked("+i+");this.blur()' onClick='OutlookLikeBar.FolderClicked("+i+");this.blur()' TYPE='button' value='"+Folder[0]+"' style='position:absolute;top:0;left:0;width:108;height:"+OB_ButtonHeight+";font-family:"+OB_ButtonFontFamily+";font-size:"+OB_ButtonFontSize+"pt;cursor:hand;color:"+OB_ButtonFontColor+";z-index:100' class='Button'>";
		MakeItems(Folder,i,OB_ButtonHeight);		
	}	
	else
	{
		ItemMenu=ItemMenu+"<INPUT position='DOWN' id='OB_Button"+i+"' onDblClick='OutlookLikeBar.FolderClicked("+i+");this.blur()' onClick='OutlookLikeBar.FolderClicked("+i+");this.blur()' TYPE='button' value='"+Folder[0]+"' style='position:absolute;top:"+(OB_Height-(j-i)*OB_ButtonHeight-OB_BorderWidth*2)+";left:0;width:108;height:"+OB_ButtonHeight+";font-family:"+OB_ButtonFontFamily+";font-size:"+OB_ButtonFontSize+"pt;cursor:hand;color:"+OB_ButtonFontColor+";z-index:100' class='Button'>";
		MakeItems(Folder,i,(OB_Height-(j-i)*OB_ButtonHeight-OB_BorderWidth*2)+OB_ButtonHeight);		
	}		
	i--;
}	
ItemMenu=ItemMenu+"</DIV>";
NavMenu.innerHTML=MainMenu+ItemMenu;

OutlookLikeBar=new OutBar(OB_Width,OB_Height,j-1,OB_ButtonHeight,OB_BorderWidth,OB_SlideSpeed,OB_IconsHeight+OB_LabelFontSize+OB_LabelMargin+OB_ItemsSpacing,OB_ArrowSlideSpeed);
document.all["OutlookLikeBar"].style.visibility="visible";

}

						

function MakeItems(Folder,zorder,top)
{
	var items=0;
	var folderWidth=(OB_Width-OB_BorderWidth*2);
	//var folderWidth=114;
	while(Folder[items+1])
		items+=4;
	items/=4;
	ItemMenu=ItemMenu+"<DIV id='OB_Folder"+zorder+"' style='position:absolute;left:0;top:"+top+";width:"+folderWidth+";height:"+(OB_Margin*2+items*(OB_IconsHeight+OB_LabelFontSize+OB_LabelMargin)+(items-1)*OB_ItemsSpacing)+";z-index:"+zorder+";clip:rect(0 0 0 0);'>";
	for(var i=1;i<items*4;i+=4)
	{
		ItemMenu=ItemMenu+"<div targetFrame='"+Folder[i+3]+"' link='"+Folder[i+2]+"' onMouseDown='OutlookLikeBar.ItemClicked(this)' onMouseUp='OutlookLikeBar.ItemSelected(this)' onMouseOver='OutlookLikeBar.OverItems(this)' onMouseOut='OutlookLikeBar.OutItems(this)' style='position:absolute;left:"+(Math.ceil((OB_Width-OB_BorderWidth*2-OB_IconsHeight)/2)-1)+";top:"+(OB_Margin+Math.ceil((i-1)/4)*(OB_ItemsSpacing+OB_LabelFontSize+OB_IconsHeight))+";cursor:hand;clip:rect(0 "+OB_IconsWidth+" "+OB_IconsHeight+" 0;width:"+OB_IconsWidth+";height:"+OB_IconsHeight+"'>";
 		ItemMenu=ItemMenu+"<img src='"+Folder[i]+"'>";
		ItemMenu=ItemMenu+"</div>";
		ItemMenu=ItemMenu+"<div align='center' style='position:absolute; width:104; ;left:0;top:"+(OB_LabelMargin+OB_IconsHeight+OB_Margin+Math.ceil((i-1)/4)*(OB_ItemsSpacing+OB_LabelFontSize+OB_IconsHeight))+";font-family:"+OB_LabelFontFamily+";font-size:"+OB_LabelFontSize+"pt;color:"+OB_LabelFontColor+"'>";
		ItemMenu=ItemMenu+Folder[i+1];
		ItemMenu=ItemMenu+"</div>";
	}	
	ItemMenu=ItemMenu+"</DIV>";
}


//***************************
//* Outlook-Like Bar Object *
//***************************
function OutBar(width,height,items,buttonHeight,borderWidth,slideSpeed,slideArrowValue,ArrowSlideSpeed)
{
	this.currentFolder=1;
	this.currentItem=null;
	this.slideCount=0;
	this.slideStep=1;
	this.slideArrowValue=slideArrowValue;
	this.slideSpeed=slideSpeed;
	this.borderWidth=borderWidth;
	this.width=width;
	this.visibleAreaHeight=height-2*borderWidth-items*buttonHeight;
	this.visibleAreaWidth=width;
	this.FolderClicked=FolderClicked;
	this.SlideFolders=SlideFolders;
	this.ItemClicked=ItemClicked;
	this.ItemSelected=ItemSelected;
	this.OverItems=OverItems;
	this.OutItems=OutItems;
	this.OverArrow=OverArrow;
	this.OutArrow=OutArrow;
	this.ArrowClicked=ArrowClicked;
	this.ArrowSelected=ArrowSelected;
	this.ArrowSlideSpeed=ArrowSlideSpeed;
	this.SlideItems=SlideItems;
	this.SlideItemsAction=SlideItemsAction;
	this.Start=Start;
	this.ClipFolder=ClipFolder;
	this.SetArrows=SetArrows;
	this.HideArrows=HideArrows;
	this.sliding=false;
	this.items=items;
	this.started=false;
	this.Start();
}

function FolderClicked(folder)
{

	if(this.sliding)
		return;
	if(folder==this.currentFolder)
		return;
	this.sliding=true;		
	this.slideCount=this.visibleAreaHeight;
	this.slideStep=1;
	this.countStep=0;
	this.HideArrows();
	this.SlideFolders(folder,document.all["OB_Button"+folder].position=="DOWN");
}

function SlideFolders(folder,down)
{
	var step;	
	if(down)
	{
		this.slideCount-=Math.floor(this.slideStep);
		if(this.slideCount<0)
			this.slideStep+=this.slideCount;
		step=Math.floor(this.slideStep);
		for(var i=2;i<=folder;i++)
			if(document.all["OB_Button"+i].position=="DOWN")
			{
				document.all["OB_Button"+i].style.pixelTop-=step;
				document.all["OB_Folder"+i].style.pixelTop-=step;
			}				

	    filter = /rect\((\d*)px (\d*)px (\d*)px (\d*)px\)/;

		var clipString=document.all["OB_Folder"+folder].style.clip;
		var clip=clipString.match(filter);
		this.ClipFolder(folder,parseInt(clip[1]),this.visibleAreaWidth,(parseInt(clip[3])+step),0);

		var clipString=document.all["OB_Folder"+this.currentFolder].style.clip;
		var clip=clipString.match(filter);
		this.ClipFolder(this.currentFolder,parseInt(clip[1]),this.visibleAreaWidth,(parseInt(clip[3])-step),0);

		this.slideStep*=this.slideSpeed;
		if(this.slideCount>0)
			setTimeout("OutlookLikeBar.SlideFolders("+folder+",true)",20);
		else		
		{
			for(var k=2;k<=folder;k++)
				document.all["OB_Button"+k].position="UP";
			this.currentFolder=folder;		
			this.SetArrows();
			this.sliding=false;		
		}		
	}
	else		
	{
		this.slideCount-=Math.floor(this.slideStep);
		if(this.slideCount<0)
			this.slideStep+=this.slideCount;
		step=Math.floor(this.slideStep);
		for(var i=folder+1;i<=this.items;i++)
			if(document.all["OB_Button"+i].position=="UP")
			{
				document.all["OB_Button"+i].style.pixelTop+=step;
				document.all["OB_Folder"+i].style.pixelTop+=step;
			}

	    filter = /rect\((\d*)px (\d*)px (\d*)px (\d*)px\)/;

		var clipString=document.all["OB_Folder"+folder].style.clip;
		var clip=clipString.match(filter);
		this.ClipFolder(folder,parseInt(clip[1]),this.visibleAreaWidth,(parseInt(clip[3])+step),0);

		var clipString=document.all["OB_Folder"+this.currentFolder].style.clip;
		var clip=clipString.match(filter);
		this.ClipFolder(this.currentFolder,parseInt(clip[1]),this.visibleAreaWidth,(parseInt(clip[3])-step),0);

		this.slideStep*=this.slideSpeed;
		if(this.slideCount>0)
			setTimeout("OutlookLikeBar.SlideFolders("+folder+",false)",20);
		else		
		{
			for(var k=folder+1;k<=this.items;k++)
				document.all["OB_Button"+k].position="DOWN";
			this.currentFolder=folder;		
			this.SetArrows();
			this.sliding=false;		
		}		
	}
}

function ItemClicked(item)
{
	if(this.sliding)
		return;		
	item.style.border="2 inset #ffffff";
}

function ItemSelected(item)
{
	if(this.sliding)
		return;		
	item.style.border="1 outset #ffffff";
	var link = item.attributes.link.nodeValue;
	var targetframe = item.attributes.targetframe.nodeValue;
	
	if(link.indexOf("javascript")!=-1)
	{ 
		eval(link)
	}
	else
	{ 
		eval(targetframe+".location='"+link+"'");
	}
}

function OverItems(item)
{
	if(this.sliding)
		return;		
	item.style.border="1 outset #ffffff";
	item.style.background="white";
}

function OutItems(item)
{
	if(this.sliding)
		return;		
	item.style.border="0 none black";
	item.style.background=OB_BackgroundColor;
}

function ArrowClicked(arrow)
{
	if(this.sliding)
		return;		
	arrow.style.border="1 inset #ffffff";
}

function ArrowSelected(arrow)
{
	if(this.sliding)
		return;		
	arrow.style.border="0 none black";
	this.SlideItems(arrow.id=="OB_SlideUp");
}

function OverArrow(arrow)
{
	if(this.sliding)
		return;		
	arrow.style.border="1 outset #ffffff";
}

function OutArrow(arrow)
{
	if(this.sliding)
		return;		
	arrow.style.border="0 none black";
}

function ClipFolder(folder,top,right,bottom,left)
{

	document.all["OB_Folder"+folder].style.clip='rect('+top+' '+right+' '+bottom+' '+left+')';

}

function Start()
{
	if(!this.started)
	{
		this.ClipFolder(1,0,this.visibleAreaWidth,this.visibleAreaHeight,0);
		this.SetArrows();
	}		
}

function SetArrows(){


document.all["OB_SlideUp"].style.pixelTop=document.all["OB_Button"+this.currentFolder].style.pixelTop+document.all["OB_Button"+this.currentFolder].style.pixelHeight+this.visibleAreaHeight-26;

document.all["OB_SlideUp"].style.pixelLeft=82;

document.all["OB_SlideDown"].style.pixelTop=document.all["OB_Button"+this.currentFolder].style.pixelTop+document.all["OB_Button"+this.currentFolder].style.pixelHeight+10;

document.all["OB_SlideDown"].style.pixelLeft=84;

	document.all["OB_SlideDown"].style.pixelLeft=82;

	var folder=document.all["OB_Folder"+this.currentFolder].style;
	var startTop=document.all["OB_Button"+this.currentFolder].style.pixelTop+document.all["OB_Button"+this.currentFolder].style.pixelHeight;

	if(folder.pixelTop<startTop)
		document.all["OB_SlideDown"].style.visibility="visible";
	else		
		document.all["OB_SlideDown"].style.visibility="hidden";

	if(folder.pixelHeight-(startTop-folder.pixelTop)>this.visibleAreaHeight)
		document.all["OB_SlideUp"].style.visibility="visible";
	else		
		document.all["OB_SlideUp"].style.visibility="hidden";
}

function HideArrows()
{
	document.all["OB_SlideUp"].style.visibility="hidden";
	document.all["OB_SlideDown"].style.visibility="hidden";
}

function SlideItems(up)
{
	this.sliding=true;
	this.slideCount=Math.floor(this.slideArrowValue/this.ArrowSlideSpeed);
	up ? this.SlideItemsAction(-this.ArrowSlideSpeed) : this.SlideItemsAction(this.ArrowSlideSpeed);
}

function SlideItemsAction(value)
{
	document.all["OB_Folder"+this.currentFolder].style.pixelTop+=value;
    filter = /rect\((\d*)px (\d*)px (\d*)px (\d*)px\)/;
    var clipString=document.all["OB_Folder"+this.currentFolder].style.clip;
    var clip=clipString.match(filter);
    this.ClipFolder(this.currentFolder,(parseInt(clip[1])-value),parseInt(clip[2]),(parseInt(clip[3])-value),parseInt(clip[4]));
	this.slideCount--;
	if(this.slideCount>0)
		setTimeout("OutlookLikeBar.SlideItemsAction("+value+")",20);
	else
	{
		if(Math.abs(value)*this.ArrowSlideSpeed!=this.slideArrowValue)		
		{
			document.all["OB_Folder"+this.currentFolder].style.pixelTop+=(value/Math.abs(value)*(this.slideArrowValue%this.ArrowSlideSpeed));
		    filter = /rect\((\d*)px (\d*)px (\d*)px (\d*)px\)/;
			var clipString=document.all["OB_Folder"+this.currentFolder].style.clip;
			var clip=clipString.match(filter);
		    this.ClipFolder(this.currentFolder,(parseInt(clip[1])-(value/Math.abs(value)*(this.slideArrowValue%this.ArrowSlideSpeed))),parseInt(clip[2]),(parseInt(clip[3])-(value/Math.abs(value)*(this.slideArrowValue%this.ArrowSlideSpeed))),parseInt(clip[4]));
		}		    
		this.SetArrows();
		this.sliding=false;
	}		
}