xquery version "1.0-ml";

try {
let $location := "F:\MarkLogic\Galleria\"
let $imageName := xdmp:get-request-field-filename("img")
let $value := xdmp:get-request-field("img")
let $_ := xdmp:save(fn:concat($location,$imageName), $value)
let $path := fn:concat($location,$imageName)

return
xdmp:document-load($path,
<options xmlns="xdmp:document-load">
<uri>/{ $imageName }</uri>
<collections>
<collection>Images</collection>
</collections>
</options>),

let $name := xdmp:get-request-field("name")
let $imageName := xdmp:get-request-field-filename("img")
let $creator := xdmp:get-request-field("creator")
let $resolution := xdmp:get-request-field("resolution")
let $date := xs:string(fn:current-date())
let $date1 := fn:substring-before($date,"+")
let $pathName := fn:concat("/",$imageName)
let $fileName := fn:substring-before($pathName,".")

return
xdmp:document-insert(fn:concat($fileName,".xml"), 
<metadata xmlns:xh="http://www.w3.org/1999/xhtml">
<xh:name>{ $name }</xh:name>
<xh:creator>{ $creator }</xh:creator>
<xh:resolution>{ $resolution }</xh:resolution>
<xh:date>{ $date1 }</xh:date>
<xh:image-link>{ $pathName }</xh:image-link>
</metadata>
)
}catch($exception) {
	"Some Exception Occured",$exception
	},
	
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>
Uploading
</title>
</head>
<body bgcolor="#FFFDD0">
<h1>File Uploaded Successfully</h1>
<a href="ImageUpload.html">Go Back</a>
</body>
</html>
