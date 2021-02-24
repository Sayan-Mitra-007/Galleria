xquery version "1.0-ml";

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View Picture</title>
</head>
<body bgcolor="#FFFDD0">
<center>
<h1><i>Galleria</i></h1>
{
let $uri := xdmp:get-request-field("uri")
return 
<img style="-webkit-user-select: none;margin: auto;" 
src="{$uri}" width="416" height="625"/>
}
</center>
<div style="position:absolute;left:5%;top:30%">
{
let $uri := xdmp:get-request-field("uri")
let $name := fn:substring-before($uri,'.')
let $url := fn:concat($name,'.xml')
let $_:=xdmp:log(("Document fetched:",fn:doc($url)//name/text()))
return
<ul>
<li><h3>Name: <i>{fn:doc($url)//*:name/text()}</i></h3></li>
<li><h3>Creator: <i>{fn:doc($url)/*:metadata/*:creator/text()}</i></h3></li>
<li><h3>Resolution: <i>{fn:doc($url)/*:metadata/*:resolution/text()}</i></h3></li>
<li><h3>Date: <i>{fn:doc($url)/*:metadata/*:date/text()}</i></h3></li>
</ul>
}
</div>
</body>
</html>