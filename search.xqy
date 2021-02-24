xquery version "1.0-ml";

import module namespace search = "http://marklogic.com/appservices/search"
at "/MarkLogic/appservices/search/search.xqy";

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View Picture</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>

<body bgcolor="#FFFDD0">
<center>
<h1><i>Galleria</i></h1>
</center>

<div style="position:absolute;left:85%;top:5%;right:5%">
<a href="ViewImages.xqy"><input type="button" value="Back"/></a>
</div>
<div style="position:absolute;left:0%;top:0%;right:82%;bottom:0%;background-color:#b2beb5;">
</div>
<div style="position:absolute;left:30%;top:10%;right:20%">
<h3>Search Result for <i>{ xdmp:get-request-field("search") }</i></h3>
</div>

<div style="position:absolute;left:20%;top:20%;right:5%">
{
let $searchFor := xdmp:get-request-field("search")
let $query := search:search($searchFor)
return
if($query/@total=0) then (
<h1><i>Oops!! No such results found.</i></h1>
)
else (
let $uri1 :=  $query/search:result/@uri
let $imageLink := fn:doc($uri1)/*:metadata/*:image-link/text()
for $image in $imageLink
let $uri := fn:concat("ViewPic.xqy?uri=",$image)
return
<a href='{ $uri }'><img src='{ $image }' /></a>
)
}
</div>
</body>
</html>