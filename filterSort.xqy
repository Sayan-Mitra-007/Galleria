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
<h3>Sort Type: <i>{ xdmp:get-request-field("sort") }</i></h3>
</div>

<div style="position:absolute;left:20%;top:20%;right:5%">
{
let $sort := xdmp:get-request-field("sort")
return
if($sort="creatorAscending") then (
let $options := <options xmlns="http://marklogic.com/appservices/search">
  <sort-order type="xs:string" 
      collation="http://marklogic.com/collation/"
      direction="ascending">
    <element ns="http://www.w3.org/1999/xhtml" name="creator"/>
  </sort-order>
  </options>
let $query := search:search("",$options,1,50)
return
if($query/@total=0) then (
<h1><i>Oops!! No such results found.</i></h1>
)
else (
let $uri1 :=  $query/search:result/@uri
for $uri in $uri1
return
if(fn:substring-after($uri,".")="xml") then (
let $imageLink := fn:doc($uri)/*:metadata/*:image-link
let $uri2 := fn:concat("ViewPic.xqy?uri=",$imageLink)
return
<a href='{ $uri2 }'><img src='{ $imageLink }' /></a>
)
else()
)
)
else(
if($sort="creatorDescending") then (
let $options := <options xmlns="http://marklogic.com/appservices/search">
  <sort-order type="xs:string" 
      collation="http://marklogic.com/collation/"
      direction="descending">
    <element ns="http://www.w3.org/1999/xhtml" name="creator"/>
  </sort-order>
  </options>
let $query := search:search("",$options,1,50)
return
if($query/@total=0) then (
<h1><i>Oops!! No such results found.</i></h1>
)
else (
let $uri1 :=  $query/search:result/@uri
for $uri in $uri1
return
if(fn:substring-after($uri,".")="xml") then (
let $imageLink := fn:doc($uri)/*:metadata/*:image-link
let $uri2 := fn:concat("ViewPic.xqy?uri=",$imageLink)
return
<a href='{ $uri2 }'><img src='{ $imageLink }' /></a>
)
else()
)
)
else(
if($sort="filename") then (
let $options := <options xmlns="http://marklogic.com/appservices/search">
  <sort-order type="xs:string" 
      collation="http://marklogic.com/collation/"
      direction="ascending">
    <element ns="http://www.w3.org/1999/xhtml" name="name"/>
  </sort-order>
  </options>
let $query := search:search("",$options,1,50)
return
if($query/@total=0) then (
<h1><i>Oops!! No such results found.</i></h1>
)
else (
let $uri1 :=  $query/search:result/@uri
for $uri in $uri1
return
if(fn:substring-after($uri,".")="xml") then (
let $imageLink := fn:doc($uri)/*:metadata/*:image-link
let $uri2 := fn:concat("ViewPic.xqy?uri=",$imageLink)
return
<a href='{ $uri2 }'><img src='{ $imageLink }' /></a>
)
else()
)
)
else(
if($sort="date") then (
let $options := <options xmlns="http://marklogic.com/appservices/search">
  <sort-order type="xs:date" 
      direction="ascending">
    <element ns="http://www.w3.org/1999/xhtml" name="date"/>
  </sort-order>
  </options>
let $query := search:search("",$options,1,50)
return
if($query/@total=0) then (
<h1><i>Oops!! No such results found.</i></h1>
)
else (
let $uri1 :=  $query/search:result/@uri
for $uri in $uri1
return
if(fn:substring-after($uri,".")="xml") then (
let $imageLink := fn:doc($uri)/*:metadata/*:image-link
let $uri2 := fn:concat("ViewPic.xqy?uri=",$imageLink)
return
<a href='{ $uri2 }'><img src='{ $imageLink }' /></a>
)
else()
)
)
else(
if($sort="older") then (
let $options := <options xmlns="http://marklogic.com/appservices/search">
  <sort-order type="xs:date" 
      direction="ascending">
    <element ns="http://www.w3.org/1999/xhtml" name="date"/>
  </sort-order>
  </options>
let $query := search:search("",$options,1,50)
return
if($query/@total=0) then (
<h1><i>Oops!! No such results found.</i></h1>
)
else (
let $uri1 :=  $query/search:result/@uri
for $uri in $uri1
return
if(fn:substring-after($uri,".")="xml" and xs:date(fn:doc($uri)/*:metadata/*:date/text()) le xs:date("2020-12-14")) then (
let $imageLink := fn:doc($uri)/*:metadata/*:image-link
let $uri2 := fn:concat("ViewPic.xqy?uri=",$imageLink)
return
<a href='{ $uri2 }'><img src='{ $imageLink }' /></a>
)
else()
)
)
else(
if($sort="latest") then (
let $options := <options xmlns="http://marklogic.com/appservices/search">
  <sort-order type="xs:date" 
      direction="ascending">
    <element ns="http://www.w3.org/1999/xhtml" name="date"/>
  </sort-order>
  </options>
let $query := search:search("",$options,1,50)
return
if($query/@total=0) then (
<h1><i>Oops!! No such results found.</i></h1>
)
else (
let $uri1 :=  $query/search:result/@uri
for $uri in $uri1
return
if(fn:substring-after($uri,".")="xml" and xs:date(fn:doc($uri)/*:metadata/*:date/text()) gt xs:date("2020-12-14")) then (
let $imageLink := fn:doc($uri)/*:metadata/*:image-link
let $uri2 := fn:concat("ViewPic.xqy?uri=",$imageLink)
return
<a href='{ $uri2 }'><img src='{ $imageLink }' /></a>
)
else()
)
)
else(
<h1><i>Please Select an option!!!!</i></h1>
)
)
)
)
)
)
}
</div>
</body>
</html>