var resources = resources || (function(static){
   var raw = String.removeChangeLineAndWhiteSpace($('#' + static.translationsResourcesId).text());
   if(!String.IsNullOrEmpty(raw)){
       resources = JSON.parse(raw);
   }

   return resources;
}(static))