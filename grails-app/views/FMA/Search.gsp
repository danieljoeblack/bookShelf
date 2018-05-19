<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta name="layout" content="kickstart" />
        <title>FMA Search</title>
        <style>
            .list-group-item{
                cursor:pointer;
                text-align:center;
            }
            .list-group-item:hover{
                background-color:lightGray;
            }
            #navButtonDiv{
                float:right;
            }
        </style>
    </head>
    <body>
        <h1>FMA Search</h1>
        <h3 id="genre"><span id="page"></span></h3>
        <input type="submit" value="Genres" class="genreButton btn-primary" onclick="backToGenres()"/>
        <div id="navButtonDiv">
            <input type="submit" value="Back" class="genreButton btn-primary" onclick="navButtonPressed('back');setPageNum()"/>
            <input type="submit" value="Next" class="genreButton btn-primary" onclick="navButtonPressed('next');setPageNum()"/>            
        </div>
        <input type="checkbox" id="commercial"/>Commercial Use
        <input type="checkbox" id="podcast"/>Podcast Use
        <div id="result" class="result">
        </div>
        
    <script>
        var expandedItems = [];
        var page=1;
        var genreIdUsed;
        function setPageNum(){
            $("#page").text(page)
        }
        function trackNavButtonPressed(direction){
            $(".tracksList").remove();
            if(direction == 'back' && page>1){
                page--;
            }else if(direction =='next'){
                page++;
            }
            $(".genreList").hide();
            $(".genreButton").show();
            var commercialString="";
            var podcastString="";
            if($("#commercial").prop("checked")){
                commercialString = "&commercial="+$("#commercial").prop("checked");
            }
            if($("#podcast").prop("checked")){
                podcastString = "&podcast="+$("#podcast").prop("checked");
            }
            $.getJSON( "https://freemusicarchive.org/api/get/tracks.json?api_key=79066JXHQKPJ1ZBO&"+podcastString+commercialString+"&genre_id="+genreIdUsed+"&page="+page, function( data ) {
                var items = [];
                $.each( data.dataset, function( it ) {
                    items.push( "<li onclick='getTrackInfoById("+data.dataset[it].track_id+")' class='list-group-item' id='" +data.dataset[it].track_id +"'>" +data.dataset[it].track_title+" - "+data.dataset[it].artist_name+"</li>" );
                });
 
                $( "<ul/>", {
                    "class": "tracksList list-group",
                    html: items.join( "" )
                }).appendTo( "#result" );
            });
        }
        
        function backToGenres(){
        console.log("Back to Genres")
            
            $(".tracksList").remove();
            $(".genreList").show();
            $(".genreButton").hide();
            expandedItems =[];
        }
        
        function setGenre(genre){
            $("#genre").text(genre);
        }
        
        function getTracksForId(genreId){
            genreIdUsed=genreId;
            $(".genreList").hide();
            $(".genreButton").show();
            var commercialString="";
            var podcastString="";
            if($("#commercial").prop("checked")){
                commercialString = "&commercial="+$("#commercial").prop("checked");
            }
            if($("#podcast").prop("checked")){
                podcastString = "&podcast="+$("#podcast").prop("checked");
            }
            $.getJSON( "https://freemusicarchive.org/api/get/tracks.json?api_key=79066JXHQKPJ1ZBO&"+podcastString+commercialString+"&genre_id="+genreId, function( data ) {
                var items = [];
                $.each( data.dataset, function( it ) {
                    items.push( "<li onclick='getTrackInfoById("+data.dataset[it].track_id+")' class='list-group-item' id='" +data.dataset[it].track_id +"'>" +data.dataset[it].track_title+" - "+data.dataset[it].artist_name+"</li>" );
                });
 
                $( "<ul/>", {
                    "class": "tracksList list-group",
                    html: items.join( "" )
                }).appendTo( "#result" );
            });
        }
        
        function getTrackInfoById(trackId){
            if($.inArray(trackId,expandedItems)==-1){
                $.getJSON( "https://freemusicarchive.org/api/get/tracks.json?api_key=79066JXHQKPJ1ZBO&podcast=true&track_id="+trackId, function( data ) {
                    $(".openItem").remove();
                    var items = [];
                    $.each( data.dataset, function( it ) {
                        items.push( "<li class='list-group-item' id='" +data.dataset[it].track_id +"trackInfo'><audio controls><source src='"+data.dataset[it].track_url+"/download' type='audio/mp3'>Your browser does not support the audio element.</audio></li>" );
                    });
                    expandedItems.push(trackId);

                    $( "<ul/>", {
                        "class": "trackInfo list-group openItem",
                        html: items.join( "" )
                    }).appendTo( "#"+trackId );
                });
            }
        }
        
        //<audio controls><source src='"+data.dataset[it].track_url+"/download' type='audio/mp3'>Your browser does not support the audio element.</audio>
        function getGenres(){ 
            $(".trackList").hide();
            $.getJSON( "https://freemusicarchive.org/api/get/genres.json?api_key=79066JXHQKPJ1ZBO&podcast=true", function( data ) {
                var items = [];
                $.each( data.dataset, function( it ) {
                    items.push( "<li onclick='getTracksForId("+data.dataset[it].genre_id+"); setGenre(\""+data.dataset[it].genre_title+"\")' class='list-group-item' id='" +data.dataset[it].genre_id +"'>" +data.dataset[it].genre_title+"</li>" );
                });
 
                $( "<ul/>", {
                    "class": "genreList list-group",
                    html: items.join( "" )
                }).appendTo( "#result" );
            });
        }
        
        $(document).ready(function(){
            getGenres();
        });

        
    </script>
    </body>
    
</html>
