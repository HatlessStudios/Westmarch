// If slider values in the URL, get them
{
    var slider = document.getElementById('range-slider');
    noUiSlider.create(slider, {
        start: [1, 12],
        step: 1,
        connect: true,
        tooltips: true,
        format: {
            to: function ( value ) {
                return Math.round(value) + '';
            },
            from: function ( value ) {
                return value.replace('', '');
            }
        },
        range: {
            'min': 1,
            'max': 12
        }
    });
}

// Create the range slider
slider.noUiSlider.on('set', function(values, handle) {
    // Filter the items
    let characters = document.querySelectorAll("[data-level]");
    let lower = values[0];
    let upper = values[1];
    let invisibleCharacters = Array.from(characters).filter(x => {
        let level = parseInt(x.dataset.level);
        return (level < lower || level > upper);
    });
    let visibleCharacters = Array.from(characters).filter(x => {
        let level = parseInt(x.dataset.level);
        return level >= lower && level <= upper;
    });
    invisibleCharacters.forEach(element => {
        element.setAttribute("hidden", "true");
    });
    visibleCharacters.forEach(element => {
        element.setAttribute("hidden", "false");
    });
});

// Set the selected ordering thing
let url_string = window.location.href;
let url = new URL(url_string);
let sort = url.searchParams.get("sort");
if (sort) {
    let form_select = document.getElementById("sort_select");
    let form_option = form_select.querySelector(`[value="${sort}"`);
    form_option.setAttribute("selected", "selected");
}