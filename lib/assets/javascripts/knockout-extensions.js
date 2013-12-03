ko.bindingHandlers.link = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        var value = ko.utils.unwrapObservable(valueAccessor()) || null;

        if(value != null){
           var res = value.split('|');
            $(element).text(res[0]).attr('href', res[1]);
        }
    }
};

ko.bindingHandlers.splitList = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        var value = ko.utils.unwrapObservable(valueAccessor()) || {data:'', seperator:'|'};

        if(value.data != ''){
            var res = value.data.split('|');
            var content = '';
            for(var i = 0, j = res.length; i < j; i++){
                content += '<li>' + res[i] + '</li>'
            }
            $(element).html(content);
        }
    }
};

ko.bindingHandlers.stopBindings = {
    init: function() {
        return { controlsDescendantBindings: true };
    }
};