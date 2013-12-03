var pageVm = function(){
    var self = this;

    self.navBar = JSON.parse(String.removeChangeLine($('#' + static.navBarContentId).text())).data;
}

//for document header
var vm = new pageVm();
//for document header
ko.applyBindings({}, document.getElementById(static.documentHeaderId));

//for document body
ko.applyBindings(vm, document.getElementById(static.documentBodyId));