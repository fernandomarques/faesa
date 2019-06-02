function changeTitle(){
    document.getElementsByTagName("h3")[0].textContent;
    var elem = document.getElementsByTagName("h3");
    if(elem.length != 0){
        text = elem[0].textContent;
        if(text)
            document.title = text;
    }
}

changeTitle();