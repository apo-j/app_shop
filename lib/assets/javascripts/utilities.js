//Module utilities
(function(utils){
    var self = utils;
    self.post = function (url, params, doneCallback, failCallback, alwaysCallback){
        $.ajax({
            url:url,
            type:'POST',
            data: params
        }).done(function(data){
           if(!!doneCallback && typeof doneCallback === 'function'){
               doneCallback(data);
           }
        }).fail(function(data){
           if(!!failCallback && typeof failCallback === 'function'){
               failCallback(data);
           }
        }).always(function(data){
           if(!!alwaysCallback && typeof alwaysCallback === 'function'){
               alwaysCallback(data);
           }
        });
    };

    self.navigatorLanguage = function(){
        var userLang = navigator.language || navigator.userLanguage;
        switch(userLang.substring(0,2)){
            case 'fr' :
                return enums.languageEnum.French;
            case 'zh':
                return enums.languageEnum.French;
            default :
                return enums.languageEnum.English;
        }
    };

    return self;
}(utilities || {}))