xquery version "1.0-ml";

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View Images</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>

<body bgcolor="#FFFDD0">
<center>
<h1><i>Galleria</i></h1>
</center>

<div style="position:absolute;left:85%;top:5%;right:5%">
<a href="ImageUpload.html"><input type="button" value="Upload Image"/></a>
</div>

<div style="position:absolute;left:80%;top:12%;right:5%">
<form action="filterSort.xqy" method="post">
<select name="sort">
<option value="none">None</option>
<option value="creatorAscending">Creator Ascending</option>
<option value="creatorDescending">Creator Descending</option>
<option value="filename">Filename</option>
<option value="date">Date</option>
<option value="latest">Latest</option>
<option value="older">Older</option>
</select> &nbsp;
<input type="submit" value="Sort" />
</form>
</div>

<div style="position:absolute;left:30%;top:10%;right:20%">
<form action="search.xqy" method="post">
<input type="text" 
  style="background-position: 10px 12px; 
  background-repeat: no-repeat; 
  width: 80%; 
  font-size: 16px; 
  padding: 12px 20px 12px 40px; 
  border: 1px solid #ddd; 
  margin-bottom: 12px;" 
  name="search" placeholder="Search for Images...."/>
  &nbsp;
  <input type="submit" value="Search"/>
  </form>
</div>

<div style="position:absolute;left:0%;top:10%;right:82%;background-color:#b2beb5;">
<label><h1>Filters</h1></label>
<label><h3><i>Creators</i></h3></label>
{
let $query := cts:element-values(xs:QName("creator"))
for $creator in $query
let $uri := fn:concat("filterCreatorSearch.xqy?creator=",$creator)
return
<ul>
<li><label><h4><a href='{ $uri }' style="color:black">{ $creator }</a></h4></label></li>
</ul>
}
<label><h3><i>Choose Date</i></h3></label>
<label><h4>From</h4></label>
<form action="filterDateSearch.xqy" method="post">
<input type="date" name="fromDate" />
<label><h4>To</h4></label>
<input type="date" name="toDate" /> &nbsp;
<input type="submit" value="Go"/>
</form> 
<!--label><h3><i>Format</i></h3></label-->
</div>

<div style="position:absolute;left:20%;top:20%;right:5%">
{
for $doc in fn:collection("Images")
let $uri := fn:concat("ViewPic.xqy",fn:concat("?uri=",fn:document-uri($doc)))
return
<a href='{$uri}'><img src='{ fn:document-uri($doc) }' /></a>
}
</div>
</body>
</html>