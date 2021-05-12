window.onload=bodyLoad;

var allCollapsed = false;
var allExpanded = false;
var defaultResultMessage = "<span class='resultMessage'><i>Enter keyword</i></span>";

function documentElement(id)
{
	return document.getElementById(id);
}

function sourceElement(e)
{
	if (window.event)
		e = window.event;
	return e.srcElement? e.srcElement : e.target;
}

function dxBeforePrint()
{
	var i;
	var allElements;

	if (window.text) document.all.text.style.height = "auto";
	
	allElements = document.getElementsByTagName("*");
			
	for (i=0; i < allElements.length; i++)
	{
		if (allElements[i].tagName == "body") 
		{
			allElements[i].scroll = "yes";
		}
		if (allElements[i].id == "pagetop") 
		{
			allElements[i].style.margin = "0px 0px 0px 0px";
			allElements[i].style.width = "100%";
		}
		if (allElements[i].id == "pagebody") 
		{
			allElements[i].style.overflow = "visible";
			allElements[i].style.top = "5px";
			allElements[i].style.width = "100%";
			allElements[i].style.padding = "0px 10px 0px 30px";
		}
		if (allElements[i].id == "seealsobutton") 
		{
			allElements[i].style.display = "none";
		}
	}
}

function dxAfterPrint()
{
	 document.location.reload();
}    

function bodyLoad()
{
	/*COLLAPSESECTIONS*/
	SetCollapseAll();
	SplitWindow();
	window.onbeforeprint = dxBeforePrint;
	window.onafterprint = dxAfterPrint;
	getImageDir();
	replaceImgPath();
}

function getImageDir()
{
	var srvImg = document.getElementById("img000Database enginessrv_index_htm");
	var ssisImg = document.getElementById("img000Package Filespackage_index_htm");
	var srvImgPath = null;
	var ssisImgPath = null;
	var imgDir = document.getElementById("image-dir");
	
	if (srvImg != null)
	{
		srvImgPath = srvImg.src;
		
		if (srvImgPath.indexOf("ImagesMetro") > -1)
		{
			imgDir.innerHTML = "ImagesMetro";
		}
		else
		{
			document.getElementById("help-meni").style.display = "none";
		}
	}
	
	if (ssisImg != null)
	{
		ssisImgPath = ssisImg.src;
		
		if (ssisImgPath.indexOf("ImagesMetro") > -1)
		{
			imgDir.innerHTML = "ImagesMetro";
		}
		else
		{
			document.getElementById("help-meni").style.display = "none";
		}
	}
	
	fixToggleButtons();
}

function fixToggleButtons()
{
	var toggleButtons = document.getElementsByName("toggleSwitch");
	
	for (var i=0; i<toggleButtons.length; i++)
	{
		btnSrc = toggleButtons[i].src;
		btnSrc = btnSrc.replace("//collapse.gif", "/collapse.gif");
		toggleButtons[i].src = btnSrc;
	}
	
	/*FIXPREVIEWSECTIONCALL*/
}

function fixPreviewSection()
{
	var imageElementDetails = document.getElementById("detailsToggle");
	
	if (imageElementDetails != null) {
	
		if (allCollapsed)
		{
			imageElementDetails.src = expandImage.src;
			imageElementDetails.alt = expandImage.alt;
		}
		else
		{
			imageElementDetails.src = collapseImage.src;
			imageElementDetails.alt = collapseImage.alt;
		}
	}
	
	var imageElementSeeAlso = document.getElementById("seealsoToggle");
	
	if (imageElementSeeAlso != null) {
	
		if (allCollapsed)
		{
			imageElementSeeAlso.src = expandImage.src;
			imageElementSeeAlso.alt = expandImage.alt;
		}
		else
		{
			imageElementSeeAlso.src = collapseImage.src;
			imageElementSeeAlso.alt = collapseImage.alt;
		}
	}
}

function bodyResize()
{
	SplitWindow();
}

function SplitWindow()
{ 
	var screen = new SplitScreen('pagetop', 'pagebody');       
} 

function SplitScreen (nonScrollingRegionId, scrollingRegionId) 
{
	this.nonScrollingRegion = document.getElementById(nonScrollingRegionId);
	this.scrollingRegion = document.getElementById(scrollingRegionId);
	document.body.scroll = "no";
	document.body.style.margin = "0px";
	document.body.style.overflow = "hidden";

	this.scrollingRegion.style.scrollbarTrackColor = "FFFFFF";
	this.scrollingRegion.style.scrollbarArrowColor = "444444";
	this.scrollingRegion.style.scrollbarBaseColor = "FFFFFF";

	if(this.scrollingRegion)
	{
		this.scrollingRegion.style.overflowY = "auto";
	}
	this.resize(null);
	RegisterEventHandler(window, 'resize', GetInstanceDelegate(this, "resize"));
}

SplitScreen.prototype.resize = function(e) 
{
	if(this.scrollingRegion)
	{
		this.scrollingRegion.style.height = document.body.clientHeight - this.nonScrollingRegion.offsetHeight - 10;
		this.scrollingRegion.style.width = document.body.clientWidth;
	}
}

function RegisterEventHandler (element, event, handler) 
{
	if (element.attachEvent) 
	{
		element.attachEvent('on' + event, handler);
	} 
	else if (element.addEventListener) 
	{
		element.addEventListener(event, handler, false);
	} 
	else 
	{
		element[event] = handler;
	}
}


function GetInstanceDelegate (obj, methodName) 
{
	return( function(e) {
		e = e || window.event;
		return obj[methodName](e);
	} );
}

function ExpandCollapse(prefixSection)
{
	imageItem = document.getElementById(prefixSection+"Toggle");

	if (imageItem.src == collapseImage.src)
	{
		imageItem.src = expandImage.src;
		imageItem.alt = expandImage.alt;
		CollapseSection(prefixSection+"Section");		
	}
	else
	{
		imageItem.src = collapseImage.src;
		imageItem.alt = collapseImage.alt;
		ExpandSection(prefixSection+"Section");
	}
	var imgElements = document.getElementsByTagName('IMG');
	allCollapsed = true;
	allExpanded = true;
	for (i = 0; i < imgElements.length; ++i)
	{
		if(imgElements[i].className == "toggle")
		{
			if(imgElements[i].src == collapseImage.src)
			{
				allCollapsed = false;
			}			
			if(imgElements[i].src == expandImage.src)
			{
				allExpanded = false;
			}			
		}
	}
	SetCollapseAll();
}	

function SubExpandAll(imgElements)
{
		for (i = 0; i < imgElements.length; ++i)
		{
			if(imgElements[i].className == "toggle")
			{
				imgElements[i].src = collapseImage.src;
				imgElements[i].alt = collapseImage.alt;			
			}
			if(imgElements[i].className == "section")
			{
				ExpandSection(imgElements[i].id);
			}
			
		}
}
function SubCollapseAll(imgElements)
{
		for (i = 0; i < imgElements.length; ++i)
		{
			if(imgElements[i].className == "toggle")
			{
				imgElements[i].src = expandImage.src;
				imgElements[i].alt = expandImage.alt;
			}
			if(imgElements[i].className == "section")
			{
				CollapseSection(imgElements[i].id);
			}
		}
}

function ExpandCollapseSections(obj)
{
	var imgElements1 = document.getElementsByTagName('IMG');
	var imgElements2 = document.getElementsByTagName('DIV');
	var i;
	var imgItem = document.getElementById("toggleAllImage");
	var imgSrc = String(imgItem.src);
	var colapseLabel = document.getElementById("collapseAllLabel");
	var expandLabel = document.getElementById("expandAllLabel");
	
	if (imgSrc.indexOf("expand.gif") > 0)
	{
		imgSrc = imgSrc.replace("expand.gif", "collapse.gif");
		SubExpandAll(imgElements1);
		SubExpandAll(imgElements2);
		colapseLabel.style.display = "inline";
		expandLabel.style.display = "none";
		
		allExpanded = true;
		allCollapsed = false;
	}
	else
	{
		imgSrc = imgSrc.replace("collapse.gif", "expand.gif");
		SubCollapseAll(imgElements1);
		SubCollapseAll(imgElements2);
		colapseLabel.style.display = "none";
		expandLabel.style.display = "inline";
		
		allExpanded = true;
		allCollapsed = false;
	}
	imgItem.setAttribute("src", imgSrc);
}

function ExpandCollapseAll(imageItem)
{   
	var imgElements1 = document.getElementsByTagName('IMG');
	var imgElements2 = document.getElementsByTagName('DIV');
	var i;
	if (imageItem.src == expandImage.src)
	{
		imageItem.src = collapseImage.src;
		imageItem.alt = collapseImage.alt;
		SubExpandAll(imgElements1);
		SubExpandAll(imgElements2);
		SetToggleAllLabel(false);
		
		allExpanded = true;
		allCollapsed = false;
	}
	else
	{	
		imageItem.src = expandImage.src;
		imageItem.alt = expandImage.alt;
		SubCollapseAll(imgElements1);
		SubCollapseAll(imgElements2);		
		SetToggleAllLabel(true);
		
		allExpanded = false;
		allCollapsed = true;
	}
}

function ExpandCollapse_CheckKey(sectionId)
{
	if(window.event.keyCode == 13)
		ExpandCollapse(sectionId);
}

function ExpandCollapseAll_CheckKey(sectionId)
{
	if(window.event.keyCode == 13)
		ExpandCollapseAll(sectionId);
}

function ExpandSection(sectionId)
{
//	try
    	//{
		document.getElementById(sectionId).style.display	= "";
    	//}
    	//catch(){}
}

function CollapseSection(sectionId)
{
		//try
    	//{	    
		document.getElementById(sectionId).style.display	= "none";
    	//}
    	//catch (){}
}

function SetCollapseAll()
{
	var imageElement = document.getElementById("toggleAllImage");
	
	if (imageElement == null) return;
	
	if (allCollapsed)
	{
		imageElement.src = expandImage.src;
		imageElement.alt = expandImage.alt;
	}
	else
	{
		imageElement.src = collapseImage.src;
		imageElement.alt = collapseImage.alt;
	}
	
	SetToggleAllLabel(allCollapsed);
}

function SetToggleAllLabel(collapseAll)
{
	var labelElement = document.getElementById("collapseAllLabel");
	
	if (labelElement == null) return;
		
	labelElement.style.display = "none";
	
	labelElement = document.getElementById("expandAllLabel");
	labelElement.style.display = "none";
	
	if (collapseAll)
	{
		labelElement = document.getElementById("expandAllLabel");
		labelElement.style.display = "inline";
	}
	else
	{
		labelElement = document.getElementById("collapseAllLabel");
		labelElement.style.display = "inline";
	}
}

function searchToggle()
{
	var helpMeni = document.getElementById("help-meni");
	var searchField = document.getElementById("searchField");
	
	if (helpMeni.className == "help-meni-normal")
	{
		document.getElementById("searchField").readOnly = false;
		document.getElementById("searchField").disabled = false;
		helpMeni.className = "help-meni-expanded";
		searchField.className = "search-field-shown";
	}
	else if (helpMeni.className == "help-meni-expanded")
	{
		document.getElementById("searchField").readOnly = true;
		document.getElementById("searchField").disabled = true;
		helpMeni.className = "help-meni-normal";
		document.getElementById("searchField").value = "";
		document.getElementById("search-result").innerHTML = defaultResultMessage;
		document.getElementById("search-result").className = "result-hidden";
		searchField.className = "search-field-hidden";
	}
}

function searchItem(targetString)
{
	if (targetString != "")
	{
		getSearchResult(targetString);
	}
	else
	{
		document.getElementById("search-result").innerHTML = defaultResultMessage;
	}
}

function getSearchResult(targetString)
{
	if (!document.getElementById("indexList"))
	{
		createIndex();
	}
	
	if (document.getElementById("resultList"))
	{
		document.getElementById("search-result").removeChild(document.getElementById("resultList"));
	}
	var body = document.getElementsByClassName("toc");
	var listItems = body[0].getElementsByTagName("li");
	var itemNames = new Array();
	var resultList = document.createElement("ul");
	resultList.id = "resultList";
	var resultField = document.getElementById("search-result");
	var noResultMessage = "<span class='resultMessage'><i>No matching results found</i></span>";
	var arr = new Array();
	
	for (var i=0; i<listItems.length; i++)
	{
		var st = listItems[i].lastChild.innerHTML;
		
		if (st.indexOf(targetString) > -1)
		{
			var listItem = document.createElement("li");
			var itemLink = document.createElement("a");
			itemLink.innerHTML = listItems[i].lastChild.innerHTML;
			itemLink.title = listItems[i].lastChild.innerHTML;
			itemLink.href = listItems[i].lastChild.href;
			itemLink.target = "frmView";
			resultList.appendChild(listItem);
			listItem.appendChild(itemLink);
			
			arr.push(itemLink);
		}
	}
	
	if (arr.length == 0)
	{
		resultField.innerHTML = noResultMessage;
		document.getElementById("searchField").style.borderColor = "#FF0000";
	}
	else
	{
		resultField.innerHTML = "";
		resultField.appendChild(resultList);
		document.getElementById("searchField").style.borderColor = "#003366";
	}
}

function createIndex()
{
	var indexList = document.createElement("ul");
	var body = document.getElementsByClassName("toc");
	var indexItems = body[0].getElementsByTagName("li");
	
	var itemNameArr = new Array();
	var itemLinkArr = new Array();
	var indexListItemArr = new Array();
	
	for (var i=0; i<indexItems.length; i++)
	{
		var listItem = document.createElement("li");
		var itemLink = document.createElement("a");
		
		if ((indexItems[i].lastChild.innerHTML in itemNameArr) == false)
		{
			itemNameArr.push(indexItems[i].lastChild.innerHTML);
			itemLinkArr.push(indexItems[i].lastChild.href);
		
			itemLink.innerHTML = indexItems[i].lastChild.innerHTML;
			itemLink.title = indexItems[i].lastChild.innerHTML;
			itemLink.href = indexItems[i].lastChild.href;
			itemLink.target = "frmView";
			indexList.id = "indexList";
			indexList.appendChild(listItem);
			listItem.appendChild(itemLink);
		}
	}
	
	//document.getElementById("pagebody").appendChild(indexList);
}

function displayResult()
{
	document.getElementById("search-result").className = "result-shown";
	if (document.getElementById("searchField").value == "")
	{
		document.getElementById("search-result").innerHTML = defaultResultMessage;
	}
}

function hideResult()
{
	setTimeout(function() {
		document.getElementById("search-result").className = "result-hidden";
	}, 300);
	//document.getElementById("search-result").className = "result-hidden";
}

function hyperlinkClick()
{
	alert("hl");
}

function replaceImgPath()
{
	var path = "";
	var logos = document.getElementsByTagName("img");
	var styleHref = document.getElementsByTagName("link")[0].getAttribute("href");
	var pathDiff = styleHref.length - 9;
	var imgHeader = logos[0].getAttribute("src");
	var imgFooter = logos[1].getAttribute("src");
	
	if(pathDiff > 0)
	{
		pathDiff = pathDiff / 3;
	}
	
	for(var i=0; i<pathDiff; i++)
	{
		path += "../";
	}
	var imagePath = path + "logo.png";
	
	for(var j=0; j<logos.length; j++)
	{
		var logoSrc = logos[j].getAttribute("src");
		if(logoSrc != null && logoSrc.indexOf("logo.png") != -1)
		{
			logos[j].setAttribute("src", imagePath);
		}
	}
}