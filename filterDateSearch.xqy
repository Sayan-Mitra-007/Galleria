xquery version "1.0-ml";

import module namespace search = "http://marklogic.com/appservices/search"
at "/MarkLogic/appservices/search/search.xqy";
declare namespace xh = "http://www.w3.org/1999/xhtml";
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
<h3>Date:<i>{ xdmp:get-request-field("fromDate") } - {xdmp:get-request-field("toDate")}</i></h3>
</div>

<div style="position:absolute;left:20%;top:20%;right:5%">
{
let $fromDate := xs:date(xdmp:get-request-field("fromDate"))
let $toDate := xs:date(xdmp:get-request-field("toDate"))
let $query := cts:search(fn:doc(),cts:and-query((
cts:element-range-query(xs:QName("xh:date"),">=",$fromDate),
cts:element-range-query(xs:QName("xh:date"),"<=",$toDate))))
return
if(fn:empty($query)) then (
<h1><i>Oops!! No such results found.</i></h1>
)
else (
let $_:=xdmp:log(("Query fetched:",fn:doc($query)))
for $doc in $query
let $imageLink := $doc/*:metadata/*:image-link/text()
let $uri := fn:concat("ViewPic.xqy?uri=",$imageLink)
return
<a href='{ $uri }'><img src='{ $imageLink }' /></a>
)
}
</div>
</body>
</html>