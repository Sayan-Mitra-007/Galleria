xquery version "1.0-ml";

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Scheduling</title>
</head>
<body bgcolor="#FFFDD0">
<center>
<h1><i>Galleria</i></h1>
</center>
<div style="position:absolute;left:10%;top:10%">
{
let $response :=<p>{for $doc in fn:doc()
let $uri := fn:document-uri($doc)
let $checkType := fn:substring-after($uri,".")
return
if($checkType="xml") then(
<ul>
<li><h4>Name =><i>{ doc($uri)/*:metadata/*:name/text() }</i></h4></li>
<li><h4>Creator =><i>{ doc($uri)/*:metadata/*:creator/text() }</i></h4></li>
<li><h4>Resolution =><i>{ doc($uri)/*:metadata/*:resolution/text() }</i></h4></li>
<li><h4>Date =><i>{ doc($uri)/*:metadata/*:date/text() }</i></h4></li>
<li>===================================================================================</li>
</ul>
)
else(
)}</p>
return xdmp:save("F:\MarkLogic\Galleria\report.html",$response),xdmp:document-load("F:\MarkLogic\Galleria\report.html")
}
</div>
</body>
</html>