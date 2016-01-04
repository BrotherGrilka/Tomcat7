<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>The Heron and the Turtle</title>
	<link rel="Shortcut Icon" href="favicon.ico"/>
	<link rel="stylesheet" rev="stylesheet" href="css/sumer.css" type="text/css" media="screen"/>
	<link rel="stylesheet" rev="stylesheet" href="css/sifr.css" type="text/css" media="screen"/>
	<script src="js/sumer.js" type="text/javascript"></script>
	<script src="js/sifr.js" type="text/javascript"></script>
	<script type="text/javascript">
		if (typeof sIFR == "function")
		{
	    	sIFR();
			sIFR.replaceElement("#cecily h1", named({sFlashSrc: "swf/RKPersian.swf", sColor: "#7FFFD4", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));
		};
	</script>
</head>
<body>
	<div id="ivo"></div>
	
	<div id="aloysius">

		<div id="cecily">
				<jsp:useBean id="tikkeDice" class="beans.glyphBean"/>
				<jsp:setProperty name="tikkeDice" property="die"/>
				<jsp:setProperty name="tikkeDice" property="glyph" value="Persian"/>
				<c:set var="tikkeRoll" value="${tikkeDice.dieRoll}"/>
			<h1>
				<c:forEach begin="1" end="10">
					<c:set var="tikkeRoll" value="${tikkeDice.dieRoll}"/>
					&#<c:out value="${tikkeRoll}"/>;
				</c:forEach>
			</h1>
		</div>


<%
	String yevvysXML = request.getParameter("transliteration");
	String mannysXML = request.getParameter("translation");

	if (yevvysXML == null && mannysXML == null)
	{
		yevvysXML = "c.1.1.1.xml";
		mannysXML = "t.1.1.1.xml";
	}
	else if (mannysXML == null)
	{
		mannysXML = "t." + yevvysXML;
		yevvysXML = "c." + yevvysXML;
	}
	else
	{
		yevvysXML = "c." + mannysXML;
		mannysXML = "t." + mannysXML;
	}

	pageContext.setAttribute("yevvysXML", yevvysXML);
	pageContext.setAttribute("mannysXML", mannysXML);
%>
		<div align="right" id="toptabs">
			<div align="center" id="mannysDef"></div>
			<a href="#" style="margin-right: 1em;" class="rounded" onclick="viewTab('corpus');"><span>View Search Results</span></a>
			<a href="#" class="rounded" onclick="viewTab('blog');"><span>View Blog</span></a>
		</div>
		
		<div id="corpus">
			<table>
				<tr>
					<td valign="top" colspan="3" class="lorelei">
						Search Results
					</td>
				</tr>
				<tr>
					<td valign="top" class="pandora" style="width: 600px;">
<%@ page import = "  javax.servlet.*, javax.servlet.http.*, java.io.*, org.apache.lucene.analysis.*, org.apache.lucene.analysis.standard.StandardAnalyzer, org.apache.lucene.document.*, org.apache.lucene.index.*, org.apache.lucene.search.*, org.apache.lucene.queryParser.*, org.apache.lucene.demo.*, org.apache.lucene.demo.html.Entities, java.net.URLEncoder" %>
<%
	String FS = System.getProperty("file.separator");
	String indexLocation = getServletContext().getRealPath("") + FS + "WEB-INF" + FS + "mannysIndex";
%>
<%
/*
        Author: Andrew C. Oliver, SuperLink Software, Inc. (acoliver2@users.sourceforge.net)

        This jsp page is deliberatly written in the horrible java directly embedded 
        in the page style for an easy and concise demonstration of Lucene.
        Due note...if you write pages that look like this...sooner or later
        you'll have a maintenance nightmare.  If you use jsps...use taglibs
        and beans!  That being said, this should be acceptable for a small
        page demonstrating how one uses Lucene in a web app. 

        This is also deliberately overcommented. ;-)

*/
%>
<%!
public String escapeHTML(String s)
{
  s = s.replaceAll("&", "&amp;");
  s = s.replaceAll("<", "&lt;");
  s = s.replaceAll(">", "&gt;");
  s = s.replaceAll("\"", "&quot;");
  s = s.replaceAll("'", "&apos;");
  return s;
}
%>
<%
		int mannysCounter = 0;
        boolean error = false;                  //used to control flow for error messages
        String indexName = indexLocation;       //local copy of the configuration variable
        IndexSearcher searcher = null;          //the searcher used to open/search the index
        Query query = null;                     //the Query created by the QueryParser
        Hits hits = null;                       //the search results
        int startindex = 0;                     //the first index displayed on this page
        int maxpage    = 50;                    //the maximum items displayed on this page
        String queryString = null;              //the query entered in the previous page
        String startVal    = null;              //string version of startindex
        String maxresults  = null;              //string version of maxpage
        int thispage = 0;                       //used for the for/next either maxpage or
                                                //hits.length() - startindex - whichever is
                                                //less

try
{
	searcher = new IndexSearcher(indexName);      //create an indexSearcher for our page
                                                        //NOTE: this operation is slow for large
                                                        //indices (much slower than the search itself)
                                                        //so you might want to keep an IndexSearcher 
                                                        //open                                                 
}
catch (Exception e)
{                         //any error that happens is probably due
                                                        //to a permission problem or non-existant
                                                        //or otherwise corrupt index
%>
                <p>ERROR opening the Index - contact sysadmin!</p>
                <p>Error message: <%=escapeHTML(e.getMessage())%></p>   
<%
	error = true;                                  //don't do anything up to the footer
}
%>
<%
if (error == false)
{                                           //did we open the index?
	queryString = request.getParameter("query");           //get the search criteria
	startVal = request.getParameter("startat");         //get the start index
	maxresults  = request.getParameter("maxresults");      //get max results per page

	try
	{
		maxpage = Integer.parseInt(maxresults);    //parse the max results first
		startindex = Integer.parseInt(startVal);      //then the start index
		mannysCounter = startindex;
	}
	catch (Exception e) {} //we don't care if something happens we'll just start at 0
                                          //or end at 50
	if (queryString == null)
		throw new ServletException("no query "+       //if you don't have a query then
												"specified");      //you probably played on the 
                                                                      //query string so you get the 
                                                                      //treatment
	Analyzer analyzer = new StandardAnalyzer();           //construct our usual analyzer
	try
	{
		QueryParser qp = new QueryParser("contents", analyzer);
		query = qp.parse(queryString); //parse the
	}
	catch (ParseException e)
	{                          //query and construct the Query
                                                                      //object
                                                                      //if it's just "operator error"
                                                                      //send them a nice error HTML
                                                                      
%>
                        <p>Error while parsing query: <%=escapeHTML(e.getMessage())%></p>
<%
		error = true;                                 //don't bother with the rest of
                                                                      //the page
	}
}
%>
<%
if (error == false && searcher != null)
{                     // if we've had no errors
                                                                      // searcher != null was to handle
                                                                      // a weird compilation bug 
	thispage = maxpage;                                   // default last element to maxpage
	hits = searcher.search(query);                        // run the query 
    if (hits.length() == 0)
	{                             // if we got no results tell the user
%>
                <p> I'm sorry I couldn't find what you were looking for. </p>
<%
		error = true;                                        // don't bother with the rest of the
                                                                     // page
	}
}

if (error == false && searcher != null)
{
%>
                <table style="width: 540px;">
                <tr>
                        <td><%--Document--%></td>
                        <%--td>Summary</td--%>
                </tr>
<%
	if ((startindex + maxpage) > hits.length())
	{
		thispage = hits.length() - startindex;      // set the max index to maxpage or last
	}                                                   // actual search result whichever is less

	for (int i = startindex; i < (thispage + startindex); i++)
	{  // for each element
%>
                <tr>
<%
		Document doc = hits.doc(i);                    //get the next document
		String doctitle = doc.get("title");            //get its title
		String url = doc.get("path");                  //get its path field
		if (url != null && url.startsWith("../webapps/"))
		{								 // strip off ../webapps prefix if present
			url = url.substring(10);
		}
		if ((doctitle == null) || doctitle.equals("")) //use the path if it has no title
			doctitle = url;
                                                                       //then output!
%>
                        <td style="color: burlywood;">
							<%=++mannysCounter%>
						</td>
						<td><a href="<%=url.replaceAll("/sumer/","")%>" style="margin-left: 1em;"><%=doctitle%></a></td>
                        <%--td><%=doc.get("summary")%></td--%>
                </tr>
<%
	}
%>
<%
	if ( (startindex + maxpage) < hits.length())
	{							   //if there are more results...display 
                                                                   //the more link
		String moreurl="mannysResults.jsp?query=" + 
										URLEncoder.encode(queryString) +  //construct the "more" link
										"&amp;maxresults=" + maxpage + 
										"&amp;startat=" + (startindex + maxpage);
%>
                <tr>
                        <td></td><td><a href="<%=moreurl%>">More Results>></a></td>
                </tr>
<%
	}
%>
                </table>

<%
}                                            //then include our footer.
if (searcher != null)
	searcher.close();
%>

					</td>
					<td valign="top" id="amelia">
						<c:import url="inc/right_menu.jsp"/>
					</td>
				</tr>
			</table>
		</div>

		<div id="blog">
			<iframe src='/blojsom/blog/sumer/' frameborder='0' scrolling='no' style='width: 820px; height: 2980px; border: 0;'></iframe>
		</div>

	</div>
	<br/>
</body></html>