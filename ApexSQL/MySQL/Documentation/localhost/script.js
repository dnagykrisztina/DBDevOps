function Expand(section, image) {
    image.src = collapseImage.src;
    section.style.display = "";
}

function Collapse(section, image) {
    image.src = expandImage.src;
    section.style.display = "none";
}

function ChangeHeader(src, label) {
    toggleAllImage.src = src;
    toggleAllLabel.innerHTML = label;
}

function GetNextSection(node) {
    while (node.tagName != "SECTION")
        node = node.nextSibling;
    return node;
}

function GetImageChild(node) {
    for (i = 0; i < node.childNodes.length; i++)
        if (node.childNodes[i].tagName == "IMG")
            return node.childNodes[i];
}

function Toggle(node) {
    section = GetNextSection(node);
    if (section.style.display == "")
        Collapse(section, GetImageChild(node));
    else {
        Expand(section, GetImageChild(node));
        ChangeHeader(collapseImage.src, "Collapse all");
    }

    if (section.style.display == "none") {
        var sections = document.getElementsByTagName("SECTION");
        for (i = 0; i < sections.length; i++)
            if (sections[i].style.display == "")
                return;
        ChangeHeader(expandImage.src, "Expand all");
    }
}

function ToggleAll() {
    SetToggleAll(toggleAllImage.src == expandImage.src);
}

function SetToggleAll(needExpand) {
    sections = document.getElementsByTagName("SECTION");
    images = document.getElementsByClassName("toggle");

    if (needExpand) {
        for (i = 0; i < sections.length; i++)
            Expand(sections[i], images[i]);
        ChangeHeader(collapseImage.src, "Collapse all");
    } else {
        for (i = 0; i < sections.length; i++)
            Collapse(sections[i], images[i]);
        ChangeHeader(expandImage.src, "Expand all");
    }
}

function ToggleList(image) {
    if (image.src.endsWith("tree_minus.gif")) {
        image.src = image.src.replace("minus", "plus");
        image.parentNode.nextSibling.style.display = "none";
    } else {
        image.src = image.src.replace("plus", "minus");
        image.parentNode.nextSibling.style.display = "block";
    }
}

function Navigate(href) {
    if (parent.frames.length > 1) {
        HideAll();
        ShowListParents(GetLinkByHref(href.replace("..\\", "")));
    }
}

function HideAll() {
    lists = parent.frames[0].document.getElementsByTagName("UL");
    for (i = 0; i < lists.length; i++)
        lists[i].className = "hidden";
}

function GetLinkByHref(href) {
    links = parent.frames[0].document.getElementsByTagName("A");
    for (i = 0; i < links.length; i++)
        if (links[i].href == href)
            return links[i];
    return null;
}

function ShowListParents(node) {
    while (node.parentNode != null) {
        node = node.parentNode;
        if (node.tagName == "UL")
            node.className = "Shown";
    }
}

window.onload = function() {
    header = document.getElementsByTagName("HEADER")[0];
    if (header != undefined) {
        pagebody.style.top = header.offsetHeight + "px";
    }

    footer = document.getElementsByTagName("FOOTER")[0];
    if (footer != undefined) {
        pagebody.style.marginBottom = (footer.offsetHeight + 10) + "px";
    }
};