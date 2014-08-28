ymaps.ready(init);

    function init(){ 
    CarWashLoader.load();    
        window.myMap = new ymaps.Map("map", {
            center: [55.76, 37.64],
            zoom: 7
        });
    }